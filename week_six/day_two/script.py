import os
import pandas as pd
from dotenv import load_dotenv
from eazyetl import Extract
from sqlalchemy import create_engine

load_dotenv()
DB_URL = os.getenv("PSQL_CONN_URL")
def script(): # A dict of lists containing ids, titles, body
    url = "https://jsonplaceholder.typicode.com/posts"
    response = Extract.read_api(url=url)
    # print(response)

    """
    I need id, title, body by looping through response
    Clean the data, id should be an int
    Load to a .csv file
    Load into a PostgreSQL db
    """
    data = pd.DataFrame(response)
    # load into csv file
    data.to_csv('posts.csv')

    # Load into an LuxDE database, schema denzelstaging
    engine = create_engine(DB_URL)
    try:
        data.to_sql(name='posts', con=engine, schema='denzelstaging', if_exists='replace', index=False)
        print("Data loaded successfully!")
    except Exception as e:
        print(f"Error: {str(e)}")



script()