{{ config(materialized='view') }}

-- use case:
-- computes the states, sellers and products with the highest orders, and order amounts

select
	o.order_id,
	o.product_id,
	s.seller_id,
	o.price,
	o.freight_value,
	p.product_category_name,
	g.geolocation_zip_code_prefix,
	g.geolocation_lat,
	g.geolocation_lng,
	s.seller_city,
	s.seller_state
from
	{{ ref('stg_order_items') }} as o
left join
	{{ ref('stg_products') }} as p
on
	o.product_id = p.product_id
left join
	{{ ref('stg_sellers') }} as s
on
	o.seller_id = s.seller_id
left join
	{{ ref('stg_geolocation') }} as g
on
	g.geolocation_zip_code_prefix = s.seller_zip_code_prefix