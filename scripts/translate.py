import asyncio
import os
import pandas as pd
from googletrans import Translator

# Initialize the translator
translator = Translator()

# Define an async function to handle translation
async def translate_text(text):
    if pd.isna(text):  # Handle NaN or None values
        return ""
    try:
        # Translate from Spanish to English
        translated = await translator.translate(text, src='es', dest='en')
        return translated.text
    except Exception as e:
        print(f"Error translating text '{text}': {e}")
        return text  # Return original text if translation fails

# Function to apply async translation to a pandas series
async def translate_series(series):
    # Convert series to list and translate each element
    tasks = [translate_text(str(item)) for item in series]
    return await asyncio.gather(*tasks)

# Run the async function
async def main():
    try:
        # Load the dataset
        reviews = pd.read_csv('./data/order_reviews_dataset.csv')

        # Translate review_comment_title and review_comment_message
        reviews['review_comment_title'] = await translate_series(reviews['review_comment_title'])
        reviews['review_comment_message'] = await translate_series(reviews['review_comment_message'])

        # Ensure the output directory exists
        os.makedirs('./data/clean', exist_ok=True)

        # Save the translated dataset
        reviews.to_csv('./data/clean/reviews_translated.csv', index=False)
        print("Translation completed and saved to './data/clean/reviews_translated.csv'.")
    except Exception as e:
        print(f"Error during processing: {e}")

# Execute the async main function
if __name__ == "__main__":
    asyncio.run(main())