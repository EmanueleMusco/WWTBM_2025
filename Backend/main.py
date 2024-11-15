# ho aggiunto un file requirements.txt che python usa per tenere traccia di tutte le librerie che installiamo, ricordiamoci di fare 'pip install -r requirements.txt'
# all'inizio di ogni sessione cosi ci teniamo le librie aggiornate e condivise. Ogni volta che aggiungi una libreria fai 'pip freeze > requirements.txt' per aggiornare il file



#dividiamo il backend in moduli cosi riusciamo a lavorare su piu aspetti insieme, un modulo per il login, un modulo per le partite e il login
import asyncio
import websockets
import mysql.connector
import json

# Funzione per gestire le connessioni dei client
async def login_handler(websocket):
    try:
        # Aspetta i dati dal client
        message = await websocket.recv()
        print(f"Ricevuto messaggio: {message}")

        # Gestione del messaggio ricevuto
        data = json.loads(message)
        username = data.get("name")
        password = data.get("password")

        # Connessione al database e verifica credenziali
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="wwtbm"
        )
        cursor = mydb.cursor(dictionary=True)

        query = "SELECT * FROM utenti WHERE nome = %s AND password = %s"
        cursor.execute(query, (username, password))
        print(username, password)
        user = cursor.fetchall()
        print(len(user))
        response = {"status": "error", "message": "Credenziali errate"}
        print (user)

        if user:
            if username.lower() == "admin":
                response = {"status": "success", "role": "admin"}
            else:
                response = {"status": "success", "role": "player"}

        await websocket.send(json.dumps(response))
        print(f"Inviato: {response}")

    except Exception as e:
        print(f"Errore: {e}")
    finally:
        cursor.close()
        mydb.close()


# Funzione principale per avviare il server WebSocket
import asyncio
import websockets

async def main():
    server = await websockets.serve(login_handler, "127.0.0.1", 8766)
    print("WebSocket server avviato su ws://127.0.0.1:8766")
    await server.wait_closed()

asyncio.run(main())