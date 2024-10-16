import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(GradeCalculatorApp());
}

class GradeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int randomNum1 = 0;
  int randomNum2 = 0;
  String result = ''; // Variable to store the result

  // function to generate two random numbers and determine the result
  void play() {
    randomNum1 = Random().nextInt(3);
    randomNum2 = Random().nextInt(3);

    // Take the result of each player and determine which player wins 
    if (randomNum1 == randomNum2) {
      result = 'Draw';
    } else if ((randomNum1 == 0 && randomNum2 == 1) ||
               (randomNum1 == 1 && randomNum2 == 2) ||
               (randomNum1 == 2 && randomNum2 == 0)) {
      result = 'Player 2 wins';
    } else {
      result = 'Player 1 wins';
    }

    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 203, 154),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('ROCK PAPER SCISSORS'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Player 1
                Flexible(child:  Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.blue,
                      child: Image.asset('assets/images/$randomNum1.png'),
                    ),
                    Container(height: 8),
                    Text('Player 1'),
                  ],
                ),
                ),
                // Player 2
               Flexible(child:  Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                      child: Image.asset('assets/images/$randomNum2.png'),
                    ),
                    Container(height: 8),
                    Text('Player 2'),
                  ],
                )),
              ],
            ),
            Container(height: 30),

            // Display result
            Text(
              result,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Play button
            Container(
              height: 100,
              width: 200,
              child: ElevatedButton(
                onPressed: play,
                child: Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
