{{ config(materialized='table') }}
-- this computes te cities with th highest orders from the hihgest to the least
select
	seller_state,
	sum(price) as revenue
from
	{{ ref('int_sellers_order_items') }}
group by
	seller_state
order by
	revenue desc