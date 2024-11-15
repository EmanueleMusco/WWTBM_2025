// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class DesktopLoginPage extends StatefulWidget {
  const DesktopLoginPage({super.key});

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    //! cambiare indirizzo ip con indirizzo ip pubblico
    final _channel = WebSocketChannel.connect(
      Uri.parse(
          'ws://localhost:8766'), // Assicurati che l'indirizzo sia corretto
    );

    // Funzione per l'azione del pulsante "Accedi"
    void _onLoginPressed() {
      final name = _nameController.text;
      final password = _passwordController.text;
      print("Nome: $name, Password: $password");

      // Invia dati al server
      final loginData = jsonEncode({
        "name": name,
        "password": password,
      });

      _channel.sink.add(loginData);

      // Ascolta la risposta del server
      _channel.stream.listen((response) {
        final decodedResponse = jsonDecode(response);
        if (decodedResponse['status'] == 'success') {
          if (decodedResponse['role'] == 'admin') {
            Navigator.pushNamed(context, '/adminhome'); // Route per Admin
          }
        } else {
          // Mostra un messaggio di errore
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Errore'),
              content: Text(decodedResponse['message'] ?? 'Errore sconosciuto'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      });

      @override
      void dispose() {
        _channel.sink.close();
        super.dispose();
      }
    }

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
          // Usa Center per centrare tutto il contenuto
          child: Padding(
            // Aggiungi padding per evitare che gli elementi tocchino i bordi
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Padding orizzontale
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Campo per il nome
                SizedBox(
                  width: screenWidth *
                      0.3, // Imposta la larghezza al 30% dello schermo
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300], // Colore di sfondo
                      borderRadius:
                          BorderRadius.circular(30), // Angoli arrotondati
                    ),
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.deepPurple[50],
                      style: TextStyle(
                        color: Colors
                            .white, // Colore del testo inserito dall'utente
                        fontSize:
                            16, // Puoi anche regolare la dimensione del testo
                      ), // Colore del cursore
                      decoration: InputDecoration(
                        labelText: 'Nome',

                        hintText: 'Inserisci il tuo nome',
                        hintStyle: TextStyle(
                          color: Colors.deepPurple[100],
                        ),
                        labelStyle: TextStyle(color: Colors.deepPurple[100]),
                        border: InputBorder.none, // Rimuovi il bordo
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12), // Spaziatura interna
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // Spazio tra i campi
                ),

                // Campo per la password
                SizedBox(
                  width: screenWidth *
                      0.3, // Imposta la larghezza al 30% dello schermo
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300], // Colore di sfondo
                      borderRadius:
                          BorderRadius.circular(30), // Angoli arrotondati
                    ),
                    child: TextField(
                      controller: _passwordController,
                      cursorColor: Colors.deepPurple[50],
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors
                            .white, // Colore del testo inserito dall'utente
                        fontSize:
                            18, // Puoi anche regolare la dimensione del testo
                      ), // Colore del cursore
                      decoration: InputDecoration(
                        labelText: 'Password',

                        hintText: 'Inserisci la tua password',
                        hintStyle: TextStyle(
                          color: Colors.deepPurple[100],
                        ),
                        labelStyle: TextStyle(color: Colors.deepPurple[100]),
                        border: InputBorder.none, // Rimuovi il bordo
                        // ignore: prefer_const_constructors
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12), // Spaziatura interna
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // Spazio tra i campi
                ),

                // Pulsante "Accedi"
                SizedBox(
                  width: screenWidth * 0.2,
                  child: ElevatedButton(
                    onPressed: _onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16), // Padding per il pulsante
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      'L O G I N',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white), // Testo del pulsante
                    ),
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
