{{ config(materialized='view') }}

SELECT
    *
FROM {{ source('raw', 'product_category_name_translation') }}
