{{ config(materialized='table')}}

select
    *
from
    {{ref('int_titled_reviews')}}