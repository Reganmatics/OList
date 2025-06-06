{{ config(materialized='view')}}

select
    review_comment_title,
    review_score,
    review_comment_message,
    review_creation_date
from
    {{ ref('stg_order_reviews') }}
where
    review_comment_title not like 'nill'