# OList Project
---------------
<strong>purpose</strong>: Analytics Engineering.
## Introduction

This project uses docker, postgres and dbt to extract, Load and transform olist data for analysis and then metabase to visalise our findings

<strong>Data Source:</strong> https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

make sure to have ```docker``` and ```docker-compose``` installed before you proceed

---------------------------------------

run ```git clone https://PAT@github.com/Reganmatics/OList.git``` PAT is your github personal access token

next, run ```sudo docker-compose up``` or use ```sudo docker-compose up - d``` if you've got a bit of experience using docker.

this starts the ```postgres``` ansd ```metabase``` service 

next run the ```./script.sh``` to download the olist data and structure the directory for our project.

### dbt and docker-compose details
- db_type: postgres
- db_name: olist_db
- db_user: olistuser
- db_pass: olistpass
- db_host: localhost
- project_name: olist_project
- schema: olist
- threads: 4 (use 1 to avoid very unneccessary errrors)


## Olist Tables
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