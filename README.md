# OList Project
---------------
- make sure you have ```docker```, ```docker-compose``` installed before you proceed
run ```sudo docker-compose up```
use ```sudo docker-compose up - d```

this sstarts the ```postgres``` ansd ```metabase``` service 

db_type: postgres
db_name: olist_db
db_user: olistuser
db_pass: olistpass
db_host: localhost
project_name: olist_project
schema: olist
threads: 4


## Tables
---------
- customers
- geolocation
- order_items
- order_payments
- order_reviews
- orders
- products
- sellers
- product_category

## analytical questions
### overview
1. revenue and orders over time 
2. revenue per quarter
3. total order by product category
4. revene by product category
5. orders by product category over time

- ### filters
- date range
- date grouping
- product category

### portfolio performance
1. best selling product
2. revenue by state
3. average product rating
4. product with the highest ratingaverage product rating
5. customer satisfaction per category

- ### filters
- product category


1. highest order
2. customer with the highest order
3. 



### Revenue and orders over time

1. stg_