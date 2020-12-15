---
tags:
- pandas
- postgres
name: wiki/python/pandas
published: false

---
import psycopg2

df_to_table\[DB_COLS\].to_csv('./data/to_icms_tax_suggestion.csv',index=False)

db_connection = {

    "host": "",

    "port": "5432",

    "dbname": "",

    "user": "",

    "password": ""

}

table = "public.icms_tax_suggestion"

db_conn = psycopg2.connect(" ".join(\[f"{key}={value}" for key, value in db_connection.items()\]))

csv_file = "./data/to_icms_tax_suggestion.csv" 

copy_sql = f"COPY {table}({','.join(DB_COLS)}) FROM STDIN WITH CSV HEADER"

def run_copy():

    with db_conn.cursor() as cursor:

        cursor.copy_expert(sql=copy_sql, file=open(csv_file, "r"))

    db_conn.commit()