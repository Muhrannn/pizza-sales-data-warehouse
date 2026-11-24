
CREATE OR REPLACE TABLE
`nebeng-465903.silver.ref_pizza`
AS

SELECT
    TRIM(pizza_id) AS pizza_id,
    TRIM(pizza_type_id) AS pizza_type_id,
    UPPER(TRIM(size)) AS size,

    -- Convert IDR STRING to NUMERIC
    SAFE_CAST(
        REGEXP_REPLACE(
            TRIM(price),
            r'(?i)^IDR\s*',
            ''
        ) AS NUMERIC
    ) AS price,

    SAFE_CAST(
        REGEXP_REPLACE(
            TRIM(production_cost),
            r'(?i)^IDR\s*',
            ''
        ) AS NUMERIC
    ) AS production_cost,

    -- Source Metadata
    TRIM(created_date) AS created_date,
    updated_date,

    -- ETL Metadata
    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by

FROM
    `nebeng-465903.bronze.mst_pizza`;
