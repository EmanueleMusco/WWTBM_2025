// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void manage_game_function() {
    print("Pulsante gestisci parita premuto");
  }

  void manage_leaderboard_function() {
    print("Pulsante gestisci leaderboard premuto");
  }

  void watch_game_function() {
    print("Pulsante guarda parita premuto");
  }

  void manage_hints_function() {
    print("Pulsante modifica aiuti premuto");
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: Center(
            child: Text(
              "A D M I N  S U P R E M O",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: watch_game_function,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.pink[700],
                      ),
                      child: Text(
                        'S P E C T A  P A R T I T A ',
                        style: TextStyle(
                            fontSize: screenWidth * 0.01,
                            color: Colors.white), // Testo del pulsante
                      ),
                    ),
                  ),
                  //gestisci partita
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  //gestisci leaderboard
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: manage_leaderboard_function,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.pink[700],
                      ),
                      child: Text(
                        'G E S T I S C I  L E A D E R B O A R D',
                        style: TextStyle(
                            fontSize: screenWidth * 0.01,
                            color: Colors.white), // Testo del pulsante
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //specta partita
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: manage_game_function,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.pink[700],
                      ),
                      child: Text(
                        'G E S T I S C I  P A R T I T A ',
                        style: TextStyle(
                            fontSize: screenWidth * 0.01,
                            color: Colors.white), // Testo del pulsante
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: manage_hints_function,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.pink[700],
                      ),
                      child: Text(
                        'G E S T I S C I  A I U T I',
                        style: TextStyle(
                            fontSize: screenWidth * 0.01,
                            color: Colors.white), // Testo del pulsante
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
