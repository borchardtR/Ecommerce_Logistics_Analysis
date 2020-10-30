CREATE VIEW orders_modified AS
	SELECT o.*
	FROM orders o
	INNER JOIN order_items_modified oim ON oim.order_id=o.order_id
	GROUP BY oim.order_id