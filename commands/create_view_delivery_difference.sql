CREATE VIEW delivery_difference AS 
	SELECT
		order_id,
		DATETIME(order_estimated_delivery_date),
		DATETIME(order_delivered_customer_date),
		CAST(julianday(order_estimated_delivery_date) - julianday(order_delivered_customer_date) AS real) delivery_estimate_difference
	FROM orders_modified
	WHERE order_status='delivered' AND length(order_delivered_customer_date) > 0 AND length(order_delivered_carrier) > 0 AND length(order_approved_at) > 0
	ORDER BY 4 asc
	