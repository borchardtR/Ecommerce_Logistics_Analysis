CREATE VIEW order_reviews_modified AS 
	SELECT orev.*
	FROM orders_modified om
	LEFT JOIN order_reviews orev ON orev.order_id=om.order_id
	GROUP BY orev.order_id
	HAVING length(orev.order_id) > 0
	
	