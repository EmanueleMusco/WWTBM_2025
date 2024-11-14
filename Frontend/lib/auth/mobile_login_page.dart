// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // Funzione per l'azione del pulsante "Accedi"
    void _onLoginPressed() {
      final name = _nameController.text;
      final password = _passwordController.text;
      print("Nome: $name, Password: $password");

      // Qui puoi aggiungere la logica per l'autenticazione
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'W H O  W A N T S  T O  B E  A  M I L L I O N A I R E ',
              style: TextStyle(
                  fontSize: screenWidth * 0.04, color: Colors.deepPurple[100]),
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
                      0.8, // Imposta la larghezza al 80% dello schermo
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
                      0.8, // Imposta la larghezza al 80% dello schermo
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300], // Colore di sfondo
                      borderRadius:
                          BorderRadius.circular(30), // Angoli arrotondati
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors
                            .white, // Colore del testo inserito dall'utente
                        fontSize:
                            16, // Puoi anche regolare la dimensione del testo
                      ),
                      controller: _passwordController,
                      cursorColor: Colors.deepPurple[50], // Colore del cursore
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.deepPurple[100]),
                        hintText: 'Inserisci la tua password',
                        hintStyle: TextStyle(
                          color: Colors.deepPurple[100],
                        ),
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

                // Pulsante "Accedi"
                SizedBox(
                  width: screenWidth * 0.6,
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