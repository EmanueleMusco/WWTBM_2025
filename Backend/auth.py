#logica per l’autenticazione e la gestione utenti.

# auth.py
class AuthenticationService:
    def __init__(self, db_connection):
        self.db = db_connection

    def login(self, username, password):
        cursor = self.db.get_connection().cursor()
        query = "SELECT * FROM utenti WHERE nome = %s AND password = %s"
        cursor.execute(query, (username, password))
        result = cursor.fetchone()
        return result is not None
