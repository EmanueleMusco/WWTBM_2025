#gestione del server WebSocket per la comunicazione in tempo reale.

# websocket_server.py
import asyncio
import websockets
import json

async def handle_connection(websocket, path, auth_service, game_manager):
    async for message in websocket:
        data = json.loads(message)
        action = data.get("action")
        
        if action == "login":
            username = data.get("username")
            password = data.get("password")
            success = auth_service.login(username, password)
            response = {"action": "login_response", "success": success}
            await websocket.send(json.dumps(response))
        # Altri tipi di messaggi...

def start_websocket_server(auth_service, game_manager):
    server = websockets.serve(lambda ws, path: handle_connection(ws, path, auth_service, game_manager), "localhost", 8765)
    asyncio.get_event_loop().run_until_complete(server)
    asyncio.get_event_loop().run_forever()
