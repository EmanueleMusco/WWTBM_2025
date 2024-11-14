// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class PlayerHome extends StatefulWidget {
  const PlayerHome({super.key});

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  void gioca_function() {
    print("Tasto gioca premuto");
  }

  void visualizza_regole_function() {
    print("Tasto visualizza regole premuto");
  }

  void visualizza_classifica_function() {
    print("Tasto visualizza classifica premuto");
  }

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
                fontSize: screenWidth * 0.04, color: Colors.deepPurple[100]),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.05,
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple[600]),
              child: ElevatedButton(
                onPressed: gioca_function,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[600]),
                child: Text(
                  "G I O C A",
                  style: TextStyle(
                      color: Colors.deepPurple[50],
                      fontSize: screenWidth * 0.04),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.04,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                  onPressed: visualizza_regole_function,
                  child: Text(
                    "R E G O L E  &  A I U T I",
                    style: TextStyle(
                        color: Colors.deepPurple[300],
                        fontSize: screenWidth * 0.03),
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.04,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                  onPressed: visualizza_classifica_function,
                  child: Text(
                    "C L A S S I F I C A",
                    style: TextStyle(
                        color: Colors.deepPurple[300],
                        fontSize: screenWidth * 0.03),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
