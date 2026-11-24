SELECT 
SUM(revenue) as revenue_per_month,
SUM(quantity) as quantity_per_month,
SAFE_DIVIDE(SUM(gross_profit), SUM(revenue)) * 100 as profit_margin_per_month,
COUNT(DISTINCT order_id) as order_per_month,
gd.month,
gd.year
FROM `gold.fact_sales` fs
JOIN `gold.dim_date` gd ON fs.date_key = gd.date_key
GROUP BY gd.month, gd.year
ORDER BY year, month ASC ;


SELECT 
dt.pizza_type_name,
SUM(fs.quantity) as quantity_per_item
FROM `gold.fact_sales` fs
JOIN `gold.dim_pizza` dp ON fs.pizza_key = dp.pizza_key
JOIN `gold.dim_pizza_type` dt ON dp.pizza_type_key = dt.pizza_type_key
GROUP BY dt.pizza_type_name
ORDER BY quantity_per_item DESC, dt.pizza_type_name ASC
LIMIT 10;

SELECT 
dt.pizza_type_name,
SUM(fs.revenue) as revenue_per_item
FROM `gold.fact_sales` fs
JOIN `gold.dim_pizza` dp ON fs.pizza_key = dp.pizza_key
JOIN `gold.dim_pizza_type` dt ON dp.pizza_type_key = dt.pizza_type_key
GROUP BY dt.pizza_type_name
ORDER BY revenue_per_item DESC, dt.pizza_type_name ASC
LIMIT 10;

SELECT 
dc.category,
SUM(fs.revenue) as revenue_per_category,
SAFE_DIVIDE(SUM(gross_profit), SUM(revenue)) * 100 as profit_margin_per_category,
SUM(fs.quantity) as quantity_per_category
FROM `gold.fact_sales` fs
JOIN `gold.dim_pizza` dp ON fs.pizza_key = dp.pizza_key
JOIN `gold.dim_pizza_type` dt ON dp.pizza_type_key = dt.pizza_type_key
JOIN `gold.dim_category` dc ON dt.category_key = dc.category_key
GROUP BY dc.category
ORDER BY quantity_per_category DESC, dc.category ASC;

SELECT 
dc.customer_name,
COUNT(DISTINCT order_id) as order_per_customer,
SUM(revenue) as revenue_per_customer,
SUM(quantity) as quantity_per_customer
FROM `gold.fact_sales` fs
JOIN `gold.dim_customer` dc ON fs.customer_key = dc.customer_key
GROUP BY dc.customer_name
ORDER BY revenue_per_customer DESC
LIMIT 10;

SELECT 
complain_detail,
COUNT(DISTINCT order_id) as count_complain
FROM `gold.fact_sales` fs
WHERE is_complain = 1
GROUP BY complain_detail
ORDER BY count_complain DESC;


SELECT
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    SUM(gross_profit) AS total_gross_profit
FROM
    `nebeng-465903.gold.fact_sales`
GROUP BY
    order_hour
ORDER BY
    order_hour ASC;