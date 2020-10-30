CREATE TABLE 'geolocation_updated' (
	'geolocation_zip_code' [INTEGER] PRIMARY KEY,
	'geolocation_lat' [REAL],
	'geolocation_lng' [REAL],
	'geolocation_city' [TEXT],
	'geolocation_state' [TEXT],
	'Closest_Urban_City' [TEXT],
	'Urban_City_Distance' [REAL],
	'Urban' [INTEGER]
	)