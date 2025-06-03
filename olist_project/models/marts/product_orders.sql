{{ config(materialized='table') }}
-- this computes the orders by categories

select
	product_category_name,
	count(product_category_name) as orders
from
	{{ ref('int_sellers_order_items') }}
group by
	product_category_name
order by
	orders desc
