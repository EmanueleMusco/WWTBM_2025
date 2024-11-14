# ho aggiunto un file requirements.txt che python usa per tenere traccia di tutte le librerie che installiamo, ricordiamoci di fare 'pip install -r requirements.txt'
# all'inizio di ogni sessione cosi ci teniamo le librie aggiornate e condivise. Ogni volta che aggiungi una libreria fai 'pip freeze > requirements.txt' per aggiornare il file



#dividiamo il backend in moduli cosi riusciamo a lavorare su piu aspetti insieme, un modulo per il login, un modulo per le partite e il login
import asyncio
import websockets
import mysql.connector
import json

# Configurazione del database
DB_CONFIG = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'database': 'wwtbm'
}

# Funzione per controllare se l'utente esiste nel database
def check_user(username, password):
    try:
        # Connessione al database
        connection = mysql.connector.connect(**DB_CONFIG)
        cursor = connection.cursor()
        
        # Query di verifica dell'utente
        query = "SELECT * FROM utenti WHERE nome = %s AND password = %s"
        cursor.execute(query, (username, password))
        
        # Verifica il risultato
        result = cursor.fetchone()
        
        # Chiude la connessione
        cursor.close()
        connection.close()
        
        # Restituisce True se l'utente esiste, altrimenti False
        return result is not None
    except mysql.connector.Error as err:
        print("Errore nel database:", err)
        return False

# Funzione di gestione del WebSocket per i login
async def login_handler(websocket, path):
    async for message in websocket:
        # Decodifica del messaggio JSON ricevuto
        data = json.loads(message)
        
        # Controlla se l'azione richiesta è il login
        if data.get("action") == "login":
            username = data.get("username")
            password = data.get("password")
            
            # Verifica l'utente nel database
            user_exists = check_user(username, password)
            
            # Prepara la risposta
            response = {
                "action": "login_response",
                "success": user_exists  # True se l'utente esiste, False altrimenti
            }
            
            # Invia la risposta al client
            await websocket.send(json.dumps(response))

# Funzione principale per avviare il server WebSocket
async def main():
    # Avvia il server WebSocket in ascolto su localhost e porta 8766
    async with websockets.serve(login_handler, "localhost", 8766):
        print("Server WebSocket in ascolto su ws://localhost:8765")
        await asyncio.Future()  # Mantiene il server in esecuzione

# Esecuzione del server
if __name__ == "__main__":
    asyncio.run(main())
