
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.dim_category` AS

SELECT
    ROW_NUMBER() OVER (ORDER BY category) AS category_key,
    category,
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by
FROM (
    SELECT DISTINCT
        UPPER(TRIM(category)) AS category
    FROM
        `nebeng-465903.silver.ref_pizza_type`
    WHERE
        category IS NOT NULL
        AND TRIM(category) != ''
);
