#!/bin/bash
#echo "dev" | sudo -S docker-compose up

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate

pip3 install -r requirements.txt

# Download the Olist dataset from Kaggle
#curl -L -o ./brazilian-e-commerce-company-olist.zip\
#  https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

#unzip brazilian-e-commerce-company-olist.zip && rm brazilian-e-commerce-company-olist.zip

# Move CSV files to a data directory
#mkdir data && mv *.csv ./data

./scrpts/clean.py

# sudo docker-compose up

# cd olist_project

# # Initialize a new dbt project
# dbt debug && dbt run && dbt build