CREATE TABLE 'marketing_leads' (
	'mql_id' [TEXT] PRIMARY KEY,
	'first_contact_date' [TEXT],
	'landing_page_id' [TEXT],
	'origin' [TEXT],
	FOREIGN KEY ('mql_id')
		REFERENCES closed_deals ('mql_id')
	);