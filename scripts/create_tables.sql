create schema if not exists olist;

create table if not exists olist.customers (
	customer_id uuid primary key,
	customer_unique_id uuid not null,
	customer_zip_code_prefix int not null,
	customer_city varchar(100) not null,
	customer_state VARCHAR(2) NOT NULL CHECK (customer_state = UPPER(customer_state))
)

create table if not exists olist.geolocation (
	geolocation_zip_code_prefix int not null,
	geolocation_lat FLOAT NOT NULL,
	geolocation_lng FLOAT NOT NULL,
	geolocation_city varchar(100),
	geolocation_state varchar(2) NOT NULL CHECK (geolocation_state = UPPER(geolocation_state))
    -- PRIMARY KEY (geolocation_zip_code_prefix, geolocation_state)
)

create table if not exists olist.order_items (
	order_id uuid,
	order_item_id int,
	product_id uuid,
	seller_id uuid,
	shipping_limit_date timestamp with time zone,
	price decimal(10,2),
	freight_value decimal(10,2),
	PRIMARY KEY (order_id, product_id)
)

create table if not exiSts olist.order_payments (
	order_id uuid,
	payment_sequential int,
	payment_type varchar(30),
	payment_installments int,
	payment_value float
)

create table if not exists olist.order_reviews (
	review_id text,
	order_id uuid,
	review_score int,
	-- review_comment_title text,
	-- review_comment_message text,
	review_creation_date timestamp with time zone,
	review_answer_timestamp timestamp with time zone
)

create table olist.orders (
	order_id uuid PRIMARY KEY,
	customer_id uuid,
	order_status varchar(30),
	order_purchase_timestamp timestamp with time zone,
	order_approved_at timestamp with time zone,
	order_delivered_carrier_date timestamp with time zone,
	order_delivered_customer_date timestamp with time zone,
	order_estimated_delivery_date timestamp with time zone
)

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
)

create table if not exists olist.sellers (
	seller_id uuid PRIMARY KEY,
	seller_zip_code_prefix int,
	seller_city varchar(50),
	seller_state varchar(2)
)

create table if not exists olist.product_category_name_translation (
	product_category_name varchar(50),
	product_category_name_english varchar(50)
)

\COPY olist.order_reviews (
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
)

FROM '/Desktop/DEV/altschool/OList/data/olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

drop table olist.order_reviews
