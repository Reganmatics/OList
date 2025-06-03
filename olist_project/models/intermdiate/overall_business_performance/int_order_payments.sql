-- models/intermediate/int_order_payments
{{ config(materialized='table') }}

select
	o.order_approved_at,
	op.payment_value
from
	{{ ref('stg_orders') }} as o
left join
	{{ ref('stg_order_payments') }} as op
on
	o.order_id = op.order_id
where
	o.order_status = 'delivered'
and
	op.payment_value is not null