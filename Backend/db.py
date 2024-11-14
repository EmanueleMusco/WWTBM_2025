#gestione delle connessioni e delle operazioni al database.

import mysql.connector

config = {
  'user': 'root',
  'password': 'root',
  'host': '127.0.0.1',
  'database': 'wwtbm',
  'raise_on_warnings': True,
}

link = mysql.connector.connect(**config)