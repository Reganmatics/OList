#!/bin/bash
#echo "dev" | sudo -S docker-compose up

pip3 install dbt-core dbt-postgres

curl -L -o ./brazilian-e-commerce-company-olist.zip\
  https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

unzip brazilian-e-commerce-company-olist.zip && rm brazilian-e-commerce-company-olist.zip

# Move CSV files to a data directory
mkdir data && mv *.csv ./data
