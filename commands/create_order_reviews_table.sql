CREATE TABLE 'order_reviews' (
	'review_id' [TEXT] PRIMARY KEY,
	'order_id' [TEXT],
	'review_score' [INTEGER],
	'review_comment_title' [TEXT],
	'review_comment_message' [TEXT],
	'review_creation_date' [TEXT],
	'review_answer_timestamp' [TEXT],
	FOREIGN KEY ('order_id')
		REFERENCES orders ('order_id')