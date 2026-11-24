
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.dim_customer` AS

SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    TRIM(customer_id) AS customer_id,
    TRIM(customer_name) AS customer_name,
    UPPER(TRIM(gender)) AS gender,
    SAFE.PARSE_DATE('%Y-%m-%d', TRIM(birth_date)) AS birth_date,
    TRIM(phone_number) AS phone_number,
    LOWER(TRIM(email)) AS email,
    SAFE.PARSE_DATE('%Y/%m/%d', TRIM(open_date)) AS open_date,
    created_date,
    updated_date,
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by
FROM
    `nebeng-465903.silver.ref_customer`
WHERE
    customer_id IS NOT NULL;
