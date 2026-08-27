# Austin Bike Share: Operational Optimization Project

## 1. Project Overview
This project analyzes public bike-sharing data from Austin, Texas. The goal is to help the operations team optimize bike deployment, schedule maintenance during quiet hours, and understand user behavior patterns.

## 2. The Dataset
- **Source:** Google BigQuery Public Datasets (`bigquery-public-data.austin_bikeshare.bikeshare_trips`)
- **Tables Used:** 
  - `bikeshare_trips` (records of individual rides)
  - `bikeshare_stations` (metadata about bike stations)

## 3. Tech Stack
- **Google BigQuery** (SQL)

## 4. Exploratory Data Analysis (EDA)
Before cleaning or analyzing the data, I ran several diagnostic queries to understand the dataset's structure, completeness, and boundary limits. 

Key findings from the EDA phase:
- **Total Rows analyzed:** [Insert total rows]
- **Missing Data:** I discovered that [Insert number] rows were missing subscriber types, which informed my decision to use `COALESCE` in the cleaning stage.
- **Outliers:** Trip durations ranged from [Insert Min] to [Insert Max] minutes, highlighting the need to filter out unrealistic trips.

## 5. Key Questions & Findings

### Q1: What are the top 5 most popular starting stations?
- **Finding:** The most popular station is [Insert the top station name you found, e.g., 2nd & Congress]. 
- **Action:** Operations should prioritize this location for daily bike restocking.

### Q2: Which hours of the day are the busiest?
- **Finding:** Peak rental hours occur around [Insert busiest hours, e.g., 8 AM and 5 PM]. The quietest hours are [Insert quiet hours, e.g., 2 AM to 4 AM].
- **Action:** Schedule routine maintenance during the quiet early morning hours to avoid disrupting users.

### Q3: What are the top 3 starting stations for each subscriber type?
- **Finding:** Annual members and casual walk-up users start their rides at very different stations.
- **Action:** Position commuter-friendly bikes near transport hubs for annual members, and leisure-friendly bikes near parks for casual riders.

---

## 6. How to View the SQL Code
You can view the full queries used in this project in the files above:
- See [cleaning_queries.sql](cleaning_queries.sql) for the data cleaning process.
- See [analysis_queries.sql](analysis_queries.sql) for the business logic and aggregations.