{{ config(materialized='table') }}

-- this computes the product categories with the highest prices and the products with the highest freight values

select
	product_category_name_english,
	price,
	freight_value
from
	{{ ref('int_order_items_products') }}
