DELETE FROM order_items
WHERE order_id IN (SELECT order_id FROM order_items LIMIT 1);