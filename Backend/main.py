# ho aggiunto un file requirements.txt che python usa per tenere traccia di tutte le librerie che installiamo, ricordiamoci di fare 'pip install -r requirements.txt'
# all'inizio di ogni sessione cosi ci teniamo le librie aggiornate e condivise. Ogni volta che aggiungi una libreria fai 'pip freeze > requirements.txt' per aggiornare il file



#dividiamo il backend in moduli cosi riusciamo a lavorare su piu aspetti insieme, un modulo per il login, un modulo per le partite e il login

from db import DatabaseConnection
from auth import AuthenticationService
from game_logic import GameManager
from websocket_server import start_websocket_server

def main():
    # Configura connessione al database
    db = DatabaseConnection(host='localhost', user='root', password='root', dbname='wwtbm')
    db.connect()

    # Inizializza il servizio di autenticazione e la logica di gioco
    auth_service = AuthenticationService(db)
    game_manager = GameManager(db)

    # Avvia il server WebSocket
    start_websocket_server(auth_service, game_manager)

if __name__ == '__main__':
    main()