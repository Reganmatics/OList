{{ config(materialised='view') }}

-- this view helps compute the roducts, sellers, cities and states with highest product reviews

select
	o.review_id,
	o.order_id,
	o.review_score,
	oi.product_id,
	oi.seller_id,
	oi.price,
	oi.freight_value,
	p.product_category_name,
	s.seller_zip_code_prefix,
	g.geolocation_lat,
	g.geolocation_lng,
	s.seller_city,
	s.seller_state
from
	{{ ref('stg_order_reviews') }} as o
left join
	{{ ref('stg_order_items')}} as oi
on
	o.order_id = oi.order_id
left join
	{{ ref('stg_products')}} as p
on
	oi.product_id = p.product_id
left join
	{{ ref('stg_sellers')}} as s
on
	oi.seller_id = s.seller_id
left join
	{{ ref('stg_geolocation')}} as g
on
	s.seller_zip_code_prefix = g.geolocation_zip_code_prefix