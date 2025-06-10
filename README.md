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

run `dbt debug` to test the connection, if everything works well, it should look like the imae below
![dbt_debug_pass](/img/dbt_debug_pass.png)

next run ```dbt run``` and the output should look like 



we have the metabase homepage as 
![dbt_debug_pass](/img/metabase_home.png)


## metabase
you create your metabase instance with the following details;
- email: your-email@host.com
- pass: your_pass1
- host: postgres_olist
- database: postgres
- db: olist_db
- user: olistuser
- password: olistpass
