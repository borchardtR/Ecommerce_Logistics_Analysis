CREATE VIEW orders_delivered_summary AS
    SELECT 
        merged.*,
        c.*,
        g.geolocation_lat c_lat,
        g.geolocation_lng c_lng,
        g.Closest_Urban_City Customer_Urban_City,
        g.Urban_City_Distance Customer_Urban_Distance,
        g.Urban Customer_Urban,
        s.*,
        g2.geolocation_lat s_lat,
        g2.geolocation_lng s_lng,
        g2.Closest_Urban_City Seller_Urban_City,
        g2.Urban_City_Distance Seller_Urban_Distance,
        g2.Urban Seller_Urban,
        p.*
    FROM (
        SELECT 
            om.order_id order_id,
            om.customer_id,
            om.order_status,
            om.order_purchase_timestamp,
            om.order_approved_at,
            om.order_delivered_carrier,
            om.order_delivered_customer_date,
            om.order_estimated_delivery_date,
            SUM(oim.order_item_id) quantity,
            oim.product_id,
            oim.seller_id,
            oim.shipping_limit_date,
            oim.price,
            SUM(oim.price) price_full_quantity,
            oim.freight_value,
            SUM(oim.freight_value) freight_value_full_quantity,
            GROUP_CONCAT(opm.payment_sequential),
            GROUP_CONCAT(opm.payment_type),
            GROUP_CONCAT(opm.payment_installments),
            GROUP_CONCAT(opm.payment_value),
            MAX(opm.payment_sequential),
            SUM(opm.payment_installments),
            SUM(opm.payment_value)
        FROM orders_modified om
        LEFT JOIN order_items_modified oim ON oim.order_id=om.order_id
        LEFT JOIN order_payments_modified opm ON opm.order_id=om.order_id
        GROUP BY om.order_id
        ) as merged
    LEFT JOIN products p ON p.product_id=merged.product_id
    LEFT JOIN customers c ON c.customer_id = merged.customer_id
    LEFT JOIN geolocation_updated g ON g.geolocation_zip_code = c.customer_zip_code_prefix
    LEFT JOIN sellers s ON s.seller_id = merged.seller_id
    LEFT JOIN geolocation_updated g2 ON g2.geolocation_zip_code = s.seller_zip_code_prefix
    WHERE merged.order_status='delivered'