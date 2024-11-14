# ho aggiunto un file requirements.txt che python usa per tenere traccia di tutte le librerie che installiamo, ricordiamoci di fare 'pip install -r requirements.txt'
# all'inizio di ogni sessione cosi ci teniamo le librie aggiornate e condivise. Ogni volta che aggiungi una libreria fai 'pip freeze > requirements.txt' per aggiornare il file



#dividiamo il backend in moduli cosi riusciamo a lavorare su piu aspetti insieme, un modulo per il login, un modulo per le partite e il login

import mysql.connector

config = {
  'user': 'root',
  'password': 'root',
  'host': '127.0.0.1',
  'database': 'wwtbm',
  'raise_on_warnings': True,
}

link = mysql.connector.connect(**config)