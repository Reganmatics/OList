{{ config(materialized='table') }}

-- this computes te cities with th highest orders from the hihgest to the least

select
	product_category_name,
	AVG(review_score) as review_score
from
	{{ ref('int_seller_order_reviews') }}
group by
	product_category_name
order by
	review_score desc
