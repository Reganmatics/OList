# script

import os
import sys
import numpy as np
import pandas as pd
import psycopg2
import matplotlib.pyplot as plt


db_host='localhost'
db_name='olist_db'
db_user='olistuser'
db_pass='olistpass'

data_dir = '../data'

def clean():
    for col in reviews.columns:
        if reviews[f'{col}'].isnull().sum() / len(reviews) >= 0.5:
            reviews = reviews.drop(columns=f'{col}')
    reviews.to_csv(f'{data_dir}/clean/olist_order_reviews_dataset.csv')

def connect_to_database():
    """Establish a connection to the PostgreSQL database."""
    try:
        connection = psycopg2.connect(
            dbname=db_name,
            user=db_user,
            password=db_pass,
            host=db_host
        )
        return connection
    except Error as e:
        print(f"Error connecting to database: {e}")
        return None
    
    
def insert_order_reviews(connection, df):
    """Insert data into the order_reviews table."""
    try:
        cursor = connection.cursor()
        insert_query = """
            INSERT INTO olist.order_reviews (
                review_id,
                order_id,
                review_score,
                review_creation_date,
                review_answer_timestamp
            ) VALUES (
                %s, %s, %s, %s, %s
            )
        """
        for index, row in df.iterrows():
            review_data = (
                row['review_id'],
                row['order_id'],
                row['review_score'],
                row['review_creation_date'],
                row['review_answer_timestamp']
            )
            cursor.execute(insert_query, review_data)
        connection.commit()
        print("Order reviews inserted successfully.")
    except Error as e:
        print(f"Error inserting order reviews: {e}")
        connection.rollback()

    

def main():
    db_host='localhost'
    db_name='olist_db'
    db_user='olistuser'
    db_pass='olistpass'

    data_dir = '../data'
    
    connection = connect_to_database()
    insert_order_reviews(connection, reviews)