CREATE TABLE `nebeng-465903.silver.fact_order`
(
  order_id STRING,
  customer_id STRING,
  order_maker_id STRING,
  order_date DATE,
  order_time TIME,
  completion_time TIME,
  is_complain INT64,
  complain_detail STRING,
  created_date STRING,
  updated_date INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-19T02:49:03.303Z"
);;

CREATE TABLE `nebeng-465903.silver.fact_order_detail`
(
  order_detail_key STRING,
  order_details_id STRING,
  order_id STRING,
  pizza_id STRING,
  quantity INT64,
  created_date DATE,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-19T04:36:04.389Z"
);;

CREATE TABLE `nebeng-465903.silver.ref_customer`
(
  customer_id STRING,
  customer_name STRING,
  gender STRING,
  birth_date STRING,
  phone_number STRING,
  email STRING,
  open_date STRING,
  created_date STRING,
  updated_date INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-18T14:33:14.183Z"
);;

CREATE TABLE `nebeng-465903.silver.ref_pizza`
(
  pizza_id STRING,
  pizza_type_id STRING,
  size STRING,
  price NUMERIC,
  production_cost NUMERIC,
  created_date STRING,
  updated_date INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-18T14:42:38.952Z"
);;

CREATE TABLE `nebeng-465903.silver.ref_pizza_type`
(
  pizza_type_id STRING,
  name STRING,
  category STRING,
  ingredients STRING,
  created_date STRING,
  updated_date INT64,
  processed_at TIMESTAMP,
  processed_by STRING
)
OPTIONS(
  expiration_timestamp=TIMESTAMP "2027-01-19T02:05:32.674Z"
);;