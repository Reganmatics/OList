{{ config(materialized='table') }}
-- this computes te cities with th highest orders from the hihgest to the least
select
	product_category_name,
	sum(price) as revenue
from
	{{ ref('int_sellers_order_items') }}
group by
	product_category_name
order by
	revenue desc