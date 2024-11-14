#gestione delle meccaniche di gioco, domande, punteggio e stato del gioco.

# game_logic.py
class GameManager:
    def __init__(self, db_connection):
        self.db = db_connection

    def start_game(self, game_id):
        # Logica per iniziare una partita
        pass

    def next_question(self, player_id):
        # Logica per ottenere la prossima domanda
        pass
