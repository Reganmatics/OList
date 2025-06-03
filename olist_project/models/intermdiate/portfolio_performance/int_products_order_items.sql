{{ config(materialized='view') }}
with op as
(
	select
		order_items.price,
		order_items.freight_value,
		products.product_weight_g / 1000.0 as product_weight_kg,
		products.product_length_cm / 100.0 as product_length_m,
		products.product_width_cm /100.0 as product_width_m,
		products.product_height_cm /100.0 as product_height_m
	from
		{{ ref('stg_order_items') }} as order_items
	left join
		{{ ref('stg_products') }} as products
	on
		order_items.product_id = products.product_id
)

select
	price,
	freight_value,
	product_weight_kg,
	product_length_m * product_width_m * product_height_m as product_volume
from
	op