DELETE FROM products
WHERE product_id IN (SELECT product_id FROM products LIMIT 1);