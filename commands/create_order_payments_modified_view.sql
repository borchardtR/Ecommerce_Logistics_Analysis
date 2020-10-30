CREATE VIEW order_payments_modified AS 
	SELECT op.*
	FROM orders_modified om
	LEFT JOIN order_payments op ON op.order_id=om.order_id
