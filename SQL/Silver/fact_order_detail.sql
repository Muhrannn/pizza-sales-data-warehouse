
CREATE OR REPLACE TABLE
`nebeng-465903.silver.fact_order_detail`
AS

WITH deduplicated AS (
    SELECT DISTINCT
        NULLIF(TRIM(order_details_id), '') AS order_details_id,
        TRIM(order_id) AS order_id,
        TRIM(pizza_id) AS pizza_id,
        quantity,
        SAFE.PARSE_DATE(
            '%Y-%m-%d',
            TRIM(created_date)
        ) AS created_date

    FROM
        `nebeng-465903.bronze.trx_order_detail`

    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY
            order_details_id,
            order_id,
            pizza_id,
            quantity,
            created_date
        ORDER BY order_id
    ) = 1
)

SELECT
    GENERATE_UUID() AS order_detail_key,

    order_details_id,
    order_id,
    pizza_id,
    quantity,
    created_date,

    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by

FROM deduplicated;
