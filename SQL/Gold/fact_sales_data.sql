
CREATE OR REPLACE TABLE
  `nebeng-465903.gold.fact_sales` AS

WITH sales_data AS (
    SELECT
        od.order_detail_key,
        o.order_id,
        od.order_details_id,

        dc.customer_key,
        dp.pizza_key,
        dd.date_key,

        o.order_time,
        o.completion_time,
        o.is_complain,
        NULLIF(TRIM(o.complain_detail), '') AS complain_detail,

        od.quantity,
        dp.unit_price,
        dp.unit_cost,

        od.quantity * dp.unit_price AS revenue,
        od.quantity * dp.unit_cost AS total_cost

    FROM
        `nebeng-465903.silver.fact_order_detail` AS od

    LEFT JOIN
        `nebeng-465903.silver.fact_order` AS o
        ON od.order_id = o.order_id

    LEFT JOIN
        `nebeng-465903.gold.dim_customer` AS dc
        ON o.customer_id = dc.customer_id

    LEFT JOIN
        `nebeng-465903.gold.dim_pizza` AS dp
        ON od.pizza_id = dp.pizza_id

    LEFT JOIN
        `nebeng-465903.gold.dim_date` AS dd
        ON o.order_date = dd.full_date
)

SELECT
    *,
    revenue - total_cost AS gross_profit,

    SAFE_DIVIDE(
        revenue - total_cost,
        revenue
    ) * 100 AS profit_margin,

    CURRENT_TIMESTAMP() AS processed_at,
    'SYSTEM' AS processed_by

FROM
    sales_data;
