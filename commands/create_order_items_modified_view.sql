CREATE VIEW order_items_modified AS 
	SELECT * 
	FROM order_items oi
	WHERE oi.order_id IN (
					  SELECT order_id
                      FROM order_items
                      GROUP BY order_id
                      HAVING COUNT(DISTINCT(product_id))=1 AND COUNT(DISTINCT(seller_id))=1
                      )
	