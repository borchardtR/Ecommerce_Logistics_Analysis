CREATE TABLE 'order_payments' (
	'order_id_payment' [TEXT] PRIMARY KEY,
	'order_id' [TEXT],
	'payment_sequential' [INTEGER],
	'payment_type' [TEXT],
	'payment_installments' [INTEGER],
	'payment_value' [REAL],
	FOREIGN KEY ('order_id')
		REFERENCES orders ('order_id')
	);