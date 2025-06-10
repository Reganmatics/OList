#!/bin/bash
#echo "dev" | sudo -S docker-compose up

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate

pip3 install -r requirements.txt

#!/bin/bash

# Define file name
FILE_NAME="brazilian-e-commerce-company-olist.zip"
DATA_DIR="./data"
CLEAN_DIR="./data/clean"

# Check if the file already exists
if [ ! -f "$FILE_NAME" ]; then
  echo "Dataset not found. Downloading..."
  curl -L -o "$FILE_NAME" \
    https://www.kaggle.com/api/v1/datasets/download/erak1006/brazilian-e-commerce-company-olist
else
  echo "Dataset already exists. Skipping download."
fi

# Unzip and remove the zip file if not already unzipped
if [ ! -d "$DATA_DIR" ]; then
  unzip "$FILE_NAME" && rm "$FILE_NAME"
  
  # Create data directory and move CSVs
  mkdir "$DATA_DIR"
  mv *.csv "$DATA_DIR"
else
  echo "Data directory already exists. Skipping extraction."
fi

# Run the data cleaning script
if [ ! -d "$CLEAN_DIR" ]; then
  echo "Running data cleaning script..."
  python3 ./scripts/clean.py
else
  echo "Clean directory elready exists already: skipping cleaning"
fi

# Run docker-compose
sudo docker-compose up -d

# Wait before running the cleaning script
echo "Waiting for 10 seconds before running the cleaning script..."
sleep 10


echo "an error is expected when you run the dbt project at first."
echo "Note: this error is deliberate, so as to ensure you follow the README.md in detail."
echo "copy the dbt config and append to the /.dbt/profiles and rerun this script :) \/"

cd olist_project

dbt debug && dbt test

dbt run

dbt build
