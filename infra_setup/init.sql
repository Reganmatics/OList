create schema if not exists olist;

create table if not exists olist.customers (
	customer_id uuid primary key,
	customer_unique_id uuid not null,
	customer_zip_code_prefix int not null,
	customer_city varchar(100) not null,
	customer_state VARCHAR(2) NOT NULL CHECK (customer_state = UPPER(customer_state))
);

copy olist.customers (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
from '/data/customers_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exists olist.geolocation (
	geolocation_zip_code_prefix int not null,
	geolocation_lat FLOAT NOT NULL,
	geolocation_lng FLOAT NOT NULL,
	geolocation_city varchar(100),
	geolocation_state varchar(2) NOT NULL CHECK (geolocation_state = UPPER(geolocation_state))
);

copy olist.geolocation (geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
from '/data/geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exists olist.order_items (
	order_id uuid,
	order_item_id int,
	product_id uuid,
	seller_id uuid,
	shipping_limit_date timestamp with time zone,
	price decimal(10,2),
	freight_value decimal(10,2)
);

copy olist.order_items (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
from '/data/order_items_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exiSts olist.order_payments (
	order_id uuid,
	payment_sequential int,
	payment_type varchar(30),
	payment_installments int,
	payment_value float
);

copy olist.order_payments (order_id, payment_sequential, payment_type, payment_installments, payment_value)
from '/data/order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exists olist.order_reviews (
	review_id text,
	order_id uuid,
	review_score int,
	-- review_comment_title text,
	-- review_comment_message text,
	review_creation_date timestamp with time zone,
	review_answer_timestamp timestamp with time zone
);

-- copy olist.order_reviews (review_id, order_id, review_score, review_creation_date, review_answer_timestamp)
-- from '/data/order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

create table olist.orders (
	order_id uuid PRIMARY KEY,
	customer_id uuid,
	order_status varchar(30),
	order_purchase_timestamp timestamp with time zone,
	order_approved_at timestamp with time zone,
	order_delivered_carrier_date timestamp with time zone,
	order_delivered_customer_date timestamp with time zone,
	order_estimated_delivery_date timestamp with time zone
);

copy olist.orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
from '/data/orders_dataset.csv' DELIMITER ',' CSV HEADER;

create table olist.products (
	product_id uuid PRIMARY KEY,
	product_category_name varchar(50),
	product_name_length int,
	product_description_length int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int
);

copy olist.products (product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
from '/data/products_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exists olist.sellers (
	seller_id uuid PRIMARY KEY,
	seller_zip_code_prefix int,
	seller_city varchar(50),
	seller_state varchar(2)
);

copy olist.sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state)
from '/data/sellers_dataset.csv' DELIMITER ',' CSV HEADER;

create table if not exists olist.product_category_name_translation (
	product_category_name varchar(50),
	product_category_name_english varchar(50)
);

copy olist.product_category_name_translation (product_category_name, product_category_name_english)
from '/data/product_category_name_translation_dataset.csv' DELIMITER ',' CSV HEADER;