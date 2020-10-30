CREATE TABLE 'orders' (
	'order_id' [TEXT] PRIMARY KEY,
	'customer_id' [TEXT],
	'order_status' [TEXT],
	'order_purchase_timestamp' [TEXT],
	'order_approved_at' [TEXT],
	'order_delivered_carrier' [TEXT],
	'order_delivered_customer_date' [TEXT],
	'order_estimated_delivery_date' [TEXT],
	FOREIGN KEY ('customer_id')
		REFERENCES customers ('customer_id')
	);
	