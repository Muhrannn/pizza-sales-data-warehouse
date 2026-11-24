CREATE TABLE `nebeng-465903.gold.dim_category`
(
  category_key INT64,
  category STRING,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:37:26.646Z"
);;

CREATE TABLE `nebeng-465903.gold.dim_customer`
(
  customer_key INT64,
  customer_id STRING,
  customer_name STRING,
  gender STRING,
  birth_date DATE,
  phone_number STRING,
  email STRING,
  open_date DATE,
  created_date STRING,
  updated_date INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:41:29.555Z"
);;

CREATE TABLE `nebeng-465903.gold.dim_date`
(
  date_key INT64,
  full_date DATE,
  day INT64,
  day_name STRING,
  day_of_week INT64,
  week_of_year INT64,
  month INT64,
  month_name STRING,
  quarter INT64,
  year INT64,
  is_weekend BOOL,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:42:50.322Z"
);;

CREATE TABLE `nebeng-465903.gold.dim_pizza`
(
  pizza_key INT64,
  pizza_id STRING,
  size STRING,
  unit_price NUMERIC,
  unit_cost NUMERIC,
  pizza_type_key INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:39:44.519Z"
);;

CREATE TABLE `nebeng-465903.gold.dim_pizza_type`
(
  pizza_type_key INT64,
  pizza_type_id STRING,
  pizza_type_name STRING,
  ingredients STRING,
  category_key INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:38:57.506Z"
);;

CREATE TABLE `nebeng-465903.gold.fact_sales`
(
  order_detail_key STRING,
  order_id STRING,
  order_details_id STRING,
  customer_key INT64,
  pizza_key INT64,
  date_key INT64,
  order_time TIME,
  completion_time TIME,
  is_complain INT64,
  complain_detail STRING,
  quantity INT64,
  unit_price NUMERIC,
  unit_cost NUMERIC,
  revenue NUMERIC,
  total_cost NUMERIC,
  gross_profit NUMERIC,
  profit_margin NUMERIC,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-20T05:49:22.730Z"
);;