
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.dim_date` AS

WITH date_range AS (
    SELECT
        MIN(order_date) AS min_date,
        MAX(order_date) AS max_date
    FROM
        `nebeng-465903.silver.fact_order`
),

calendar AS (
    SELECT
        calendar_date
    FROM
        date_range,
        UNNEST(
            GENERATE_DATE_ARRAY(min_date, max_date)
        ) AS calendar_date
)

SELECT
    CAST(FORMAT_DATE('%Y%m%d', calendar_date) AS INT64) AS date_key,
    calendar_date AS full_date,
    EXTRACT(DAY FROM calendar_date) AS day,
    FORMAT_DATE('%A', calendar_date) AS day_name,
    EXTRACT(DAYOFWEEK FROM calendar_date) AS day_of_week,
    EXTRACT(WEEK FROM calendar_date) AS week_of_year,
    EXTRACT(MONTH FROM calendar_date) AS month,
    FORMAT_DATE('%B', calendar_date) AS month_name,
    EXTRACT(QUARTER FROM calendar_date) AS quarter,
    EXTRACT(YEAR FROM calendar_date) AS year,
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM calendar_date) IN (1, 7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend,
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by
FROM
    calendar;
