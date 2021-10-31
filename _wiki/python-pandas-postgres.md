---
tags:
- pandas
- python
- postgres
- wiki
title: python/pandas/postgres
layout: post
---


---
## Salvando dados do pandas no postgres

```python
import psycopg2

table_cols = ['col1','col2'...]
csv_file = 'file.csv'
table = "table_name"
db_connection = {
    "host": "<host>",
    "port": "<port>",
    "dbname": "dbname",
    "user": "<user>",
    "password": "<password>"
}
copy_sql = f"COPY {table}({','.join(table_cols)}) FROM STDIN WITH CSV HEADER"

df_to_table[table_cols].to_csv(csv_file,index=False)
db_conn = psycopg2.connect(" ".join(\[f"{key}={value}" for key, value in db_connection.items()\]))
with db_conn.cursor() as cursor:
	cursor.copy_expert(sql=copy_sql, file=open(csv_file, "r"))
    db_conn.commit()
```