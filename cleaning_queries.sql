-- ==========================================
-- DATA CLEANING PHASE
-- ==========================================

-- This query cleans the raw trip data by handling missing values,
-- filtering out bad duration data, and formatting text fields.

SELECT
	trip_id,
	-- Replace missing subscriber types with 'Unknown'
	COALESCE(subscriber_type, 'Unknown') AS subscriber_clean,

	-- Clean up station text formatting
	UPPER(TRIM(start_station_name)) AS start_station_clean,

	start_time,
	duration_minutes
FROM
	`bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE
	-- Exclude trips shorter than 1 minute and rows with missing station names
	duration_minutes >= 1
	AND start_station_name IS NOT NULL;