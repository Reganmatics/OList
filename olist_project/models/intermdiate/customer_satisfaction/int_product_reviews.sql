{{ config(materialized='view') }}

with product_reviews as
(
    select
        order_reviews.order_id,
        order_reviews.review_score,
        order_reviews.review_creation_date,
        order_items.seller_id,
        order_items.product_id,
        products.product_category_name,
        sellers.seller_city,
        sellers.seller_state,
        sellers.seller_zip_code_prefix
    from
        {{ ref('stg_order_reviews')}} as order_reviews
    left join
        {{ ref('stg_order_items')}} as order_items
    on
        order_reviews.order_id = order_items.order_id
    left join
        {{ ref('stg_products')}} as products
    on
        order_items.product_id = products.product_id
    left join
        {{ ref('stg_sellers')}} as sellers
    on
        order_items.seller_id = sellers.seller_id
),
pcnt as
(
	select
		*
	from
		{{ ref('stg_product_category_name_translation') }} as pcnt
)

select
    order_id,
    seller_id,
    product_id,
    review_score,
    pcnt.product_category_name_english as product_category,
    seller_city,
    seller_state,
    seller_zip_code_prefix
from
    product_reviews
left join
	pcnt
on
	product_reviews.product_category_name = pcnt.product_category_name