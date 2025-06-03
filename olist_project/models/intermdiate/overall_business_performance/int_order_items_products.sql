{{ config(materialized='view') }}

select
        oi.order_id,
        oi.product_id,
        oi.price,
        oi.freight_value,
        p.product_id as p_product_id,
        p.product_category_name,
        p.product_weight_g / 1000.0 as product_weight_kg,
        p.product_length_cm / 100.0 as product_length_m,
        p.product_width_cm / 100.0 as product_width_m,
        p.product_height_cm / 100.0 as product_height_m,
        pcnt.product_category_name_english
from
        {{ ref('stg_order_items') }} as oi
left join
        {{ ref('stg_products') }} as p
on oi.product_id = p.product_id
left join
        {{ ref('stg_product_category_name_translation') }} as pcnt
on
        p.product_category_name = pcnt.product_category_name