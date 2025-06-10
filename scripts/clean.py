#!/usr/bin/env python3
"""
this script cleans and saves csv files to a new directory
"""

import pandas as pd
import os

data_dir = './data'
os.mkdir(f'{data_dir}/clean')


def clean(df, df_csv):
    """
    cleans the csv files and saves the cleaned copy as a new csv file
    variables:
        df: dataframe to clean
        df_csv: name of csv file to save the cleaned copy

    return:
        cleaned dataframe
    """
    for col in df.columns:
        if df[f'{col}'].isnull().sum() / len(df) >= 0.5:
            df = df.drop(columns=f'{col}')
    df.to_csv(f'{data_dir}/clean/{df_csv}')
    return df


def fill_nulls(df, df_csv):
    df = df.fillna('nill')
    df.to_csv(f'{data_dir}/clean/{df_csv}', index=False)


def main():
    """
    main function
    """

    #print('run this script at the root of the project\nOList')
    data_dir = './data'

    reviews = pd.read_csv(f'{data_dir}/order_reviews_dataset.csv')
    fill_nulls(reviews, 'order_reviews_dataset.csv')

print(os.getcwd())
main()
