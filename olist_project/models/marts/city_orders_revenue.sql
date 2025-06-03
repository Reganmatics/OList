{{ config(materialized='table') }}
-- this computes te cities with th highest orders from the hihgest to the least
select
	seller_city,
	sum(price) as revenue
from
	{{ ref('int_sellers_order_items') }}
group by
	seller_city
order by
	revenue desc