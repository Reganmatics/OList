{{ config(materialized='table') }}

-- this computes te cities with th highest orders from the hihgest to the least

select
	avg(review_score)
from
	{{ ref('int_seller_order_reviews') }}