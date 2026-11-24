
CREATE OR REPLACE TABLE
`nebeng-465903.silver.ref_pizza_type`
AS

SELECT
    TRIM(pizza_type_id) AS pizza_type_id,
    TRIM(name) AS name,
    UPPER(TRIM(category)) AS category,
    TRIM(ingredients) AS ingredients,

    -- Source Metadata
    TRIM(created_date) AS created_date,
    updated_date,

    -- ETL Metadata
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by

FROM
    `nebeng-465903.bronze.mst_pizza_type`;
