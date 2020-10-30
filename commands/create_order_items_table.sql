CREATE TABLE 'order_items' (
	'order_id_item_id' [TEXT] PRIMARY KEY,
	'order_id' [TEXT],
	'order_item_id' [INTEGER],
	'product_id' [TEXT],
	'seller_id' [TEXT],
	'shipping_limit_date' [TEXT],
	'price' [REAL],
	'freight_value' [REAL],
	FOREIGN KEY ('order_id')
		REFERENCES orders ('order_id'),
	FOREIGN KEY ('seller_id')
		REFERENCES sellers ('seller_id'),
	FOREIGN KEY ('product_id')
		REFERENCES products ('product_id')
	);