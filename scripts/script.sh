#!/bin/bash
#echo "dev" | sudo -S docker-compose up
sudo apt update && sudo apt install -y \
  python3-pip \
  python3-venv \
  unzip \
  curl
# Create a virtual environment
#python3 -m venv venv
source venv/bin/activate

# Install dbt and dbt-postgres
pip3 install dbt-core dbt-postgres

sudo docker-compose up -d

# Download the Olist dataset from Kaggle
#curl -L -o ./brazilian-e-commerce-company-olist.zip\
#  https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist

#unzip brazilian-e-commerce-company-olist.zip && rm brazilian-e-commerce-company-olist.zip

# Move CSV files to a data directory
#mkdir data && mv *.csv ./data

# Initialize a new dbt project
dbt init olist_proj

# Move to the dbt project directory
cd olist_proj