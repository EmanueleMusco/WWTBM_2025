import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class DesktopLoginPage extends StatefulWidget {
  const DesktopLoginPage({super.key});

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variabili per gestire lo stato di caricamento e il messaggio
  bool _isLoading = false;
  String _message = '';
  late WebSocketChannel _channel;

  // Funzione per inviare il login tramite WebSocket
  Future<void> _onLoginPressed() async {
    final name = _nameController.text;
    final password = _passwordController.text;

    // Controlla se i campi sono vuoti
    if (name.isEmpty || password.isEmpty) {
      setState(() {
        _message = "Inserisci nome e password!";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _message = ''; // Reset del messaggio precedente
    });

    // Crea un oggetto JSON con i dati di login
    final Map<String, String> loginData = {
      'username': name,
      'password': password,
    };

    // Invia i dati di login tramite WebSocket
    _channel.sink.add(json.encode(loginData));

    // Ascolta la risposta dal server
    _channel.stream.listen((response) {
      setState(() {
        final data = json.decode(response);
        _message = data['message'];
        _isLoading = false;
      });
    }, onError: (error) {
      setState(() {
        _message = "Errore di connessione!";
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Crea la connessione WebSocket al server Python
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:8765'), // Indirizzo del server WebSocket
    );
  }

  @override
  void dispose() {
    _channel.sink
        .close(); // Chiude il canale WebSocket quando la pagina viene distrutta
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'W H O  W A N T S  T O  B E  A  M I L L I O N A I R E ',
              style: TextStyle(
                  fontSize: screenWidth * 0.02, color: Colors.deepPurple[100]),
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple[400],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Campo per il nome
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.deepPurple[50],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Inserisci il tuo nome',
                        hintStyle: TextStyle(color: Colors.deepPurple[100]),
                        labelStyle: TextStyle(color: Colors.deepPurple[100]),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Campo per la password
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Inserisci la tua password',
                        hintStyle: TextStyle(color: Colors.deepPurple[100]),
                        labelStyle: TextStyle(color: Colors.deepPurple[100]),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Pulsante per accedere
                SizedBox(
                  width: screenWidth * 0.2,
                  child: ElevatedButton(
                    onPressed: _onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      backgroundColor: Colors.purple,
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'L O G I N',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Messaggio di stato (successo o errore)
                if (_message.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _message,
                      style: TextStyle(
                        fontSize: 16,
                        color: _message.contains('corrette')
                            ? Colors.green
                            : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
