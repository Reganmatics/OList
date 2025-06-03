{{ config(materialized='view') }}

select
	orders.order_id,
	orders.customer_id,
	orders.order_status,
	customers.customer_state,
	order_payments.payment_value
from
	{{ ref('stg_orders') }} as orders
left join
	{{ ref('stg_customers') }} as customers
on
	orders.customer_id = customers.customer_id
left join
	{{ ref('stg_order_payments') }} as order_payments
on
	orders.order_id = order_payments.order_id