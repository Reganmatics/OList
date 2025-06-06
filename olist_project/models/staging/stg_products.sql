{{ config(materialized='view') }}

SELECT
    p.product_id,
    pcnt.product_category_name_english as product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    product_width_cm
FROM
    {{ source('raw', 'products') }} as p
left join
    {{ source('raw', 'product_category_name_translation') }} as pcnt
on
    p.product_category_name = pcnt.product_category_name
