
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.dim_pizza` AS

SELECT
    ROW_NUMBER() OVER (ORDER BY p.pizza_id) AS pizza_key,
    p.pizza_id,
    p.size,
    p.price AS unit_price,
    p.production_cost AS unit_cost,
    pt.pizza_type_key,
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by
FROM
    `nebeng-465903.silver.ref_pizza` AS p
LEFT JOIN
    `nebeng-465903.gold.dim_pizza_type` AS pt
    ON TRIM(p.pizza_type_id) = TRIM(pt.pizza_type_id)
WHERE
    p.pizza_id IS NOT NULL;
