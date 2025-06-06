# OList Project
---------------
<strong>purpose</strong>: Analytics Engineering.
## Introduction

This project uses docker, postgres and dbt to extract, Load and transform olist data for analysis and then metabase to visalise our findings

<strong>Data Source:</strong> https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

make sure to have ```docker``` and ```docker-compose``` installed before you proceed

---------------------------------------

1. run ```git clone https://PAT@github.com/Reganmatics/OList.git``` PAT is your github personal access token

2. next copy and paste te code below to your terminal, to install/update the requisite packages;

    ```
    sudo apt update && sudo apt install -y \
    python3-pip \
    python3-venv \
    unzip \
    curl \
    docker-compose \
    docker.io
    ```

    this starts the ```postgres``` and ```metabase``` service 

3. next run `./scrpts/clean.py`, then 
`sudo docker-compose up`
 to also run the *postgres* and *metabase* services and also create and populate all tables for the olist project.

## dbt

Project details

open `~/.dbt/profiles.yml` and paste the following into a new line
```
olist_project:
  outputs:
    dev:
      dbname: olist_db
      host: localhost
      pass: olistpass
      port: 5432
      schema: olist
      threads: 1
      type: postgres
      user: olistuser
  target: dev
```

run `dbt debug` to test the connection

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

## metabase
- email: snrdevtest@gmail.com
- pass: olistpass1