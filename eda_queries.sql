-- ==========================================
-- EXPLORATORY DATA ANALYSIS PHASE
-- ==========================================

-- Checking the scale of our data and the uniqueness of key fields
SELECT
	COUNT(*) AS total_rows,
	COUNT(DISTINCT trip_id) AS unique_trips,
	COUNT(DISTINCT start_station_id) AS unique_start_stations,
	COUNT(DISTINCT subscriber_type) AS unique_subscriber_types
FROM
	`bigquery-public-data.austin_bikeshare.bikeshare_trips`;

-- Checking for missing values (NULLs) in key columns
SELECT
	COUNTIF(trip_id IS NULL) AS null_trip_ids,
	COUNTIF(start_time IS NULL) AS null_start_times,
	COUNTIF(start_station_name IS NULL) AS null_start_stations,
	COUNTIF(duration_minutes IS NULL) AS null_durations,
	COUNTIF(subsciber_type IS NULL) AS null_subscriber_types
FROM
	`bigquery-public-data.austin_bikeshare.bikeshare_trips`;

-- Spotting logical errors or extreme outliers in our numerical data
SELECT
	MIN(duration_minutes) AS min_duration,
	MAX(duration_minutes) AS max_duration,
	AVG(duration_minutes) AS avg_duration,
	MIN(start_time) AS earliest_trip_date,
	MAX(start_time) AS latest_trip_date
FROM
	`bigquery-public-data.austin_bikeshare.bikeshare_trips`;

-- Checking if any trip_id appears more than once
SELECT
	trip_id,
	COUNT(*) AS occurence_count
FROM
	`bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY
	trip_id
HAVING
	occurence_count > 1;