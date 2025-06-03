{{ config(materialized='table') }}

select
	price,
	freight_value,
	product_weight_kg,
	product_length_m * product_width_m * product_height_m as product_volume
from
	{{ ref('int_order_items_products') }}