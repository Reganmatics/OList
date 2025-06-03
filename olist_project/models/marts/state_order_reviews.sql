{{ config(materialized='table') }}

-- this computes te cities with th highest orders from the hihgest to the least

select
	seller_state,
	AVG(review_score) as review_score
	-- geolocation_lat,
	-- geolocation_lng
from
	{{ ref('int_seller_order_reviews') }}
where
	seller_state is not null
group by
	seller_state
order by
	review_score desc