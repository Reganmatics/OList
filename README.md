# OList Project
---------------
<strong>purpose</strong>: Analytics Engineering.
## Introduction

This project uses docker, postgres and dbt to extract, Load and transform olist data for analysis and then metabase to visalise our findings

<strong>Data Source:</strong> https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

make sure to have ```docker``` and ```docker-compose``` installed before you proceed

---------------------------------------

1. run ```git clone https://github.com/Reganmatics/OList.git``` PAT is your github personal access token

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

3. create and activate the virtual environment

```
python3 -m venv venv \
source venv/bin/activate
```

4. run ```./scripts/auto.sh``` to istall all packages, download, clean and ingest data into the database. and then proceed with the dbt project.

<strong>Note</strong>: an error is expected when running the ```./scripts/auto.sh``` script, ths is to ensure the user engages with the project.

#### SOLUTION: READ THE DBT GUIE BELOW

## dbt

Project details

open `~/.dbt/profiles.yml` and append the text below
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


run `dbt debug` to test the connection, if everything works well, it should look like the image below
![dbt_debug_pass](/img/dbt_debug_pass.png)

next run ```dbt run``` and the output should look like 

![dbt_debug_pass](/img/dbt_run.png)


we have the metabase homepage as 
![dbt_debug_pass](/img/metabase_home.png)


#### Now rerurn the ```./scripts/auto.sh``` script and it should run smoothly


## metabase
you create your metabase instance with the following details;
- email: your-email@host.com
- pass: your_pass1
- host: postgres_olist
- database: postgres
- db: olist_db
- user: olistuser
- password: olistpass
