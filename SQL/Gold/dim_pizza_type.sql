
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.dim_pizza_type` AS

SELECT
    ROW_NUMBER() OVER (ORDER BY pt.pizza_type_id) AS pizza_type_key,
    pt.pizza_type_id,
    pt.name AS pizza_type_name,
    pt.ingredients,
    dc.category_key,
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by
FROM
    `nebeng-465903.silver.ref_pizza_type` AS pt
LEFT JOIN
    `nebeng-465903.gold.dim_category` AS dc
    ON UPPER(TRIM(pt.category)) = dc.category
WHERE
    pt.pizza_type_id IS NOT NULL;