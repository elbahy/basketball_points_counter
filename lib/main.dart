import 'package:flutter/material.dart';

void main() {
  runApp(BasketballCounter());
}

class BasketballCounter extends StatefulWidget {
  @override
  State<BasketballCounter> createState() => _BasketballCounterState();
}

class _BasketballCounterState extends State<BasketballCounter> {
  int teamAScore = 0;
  int teamBScore = 0;

  Text showRes(String team) => team == 'A'
      ? Text('$teamAScore', style: TextStyle(fontSize: 150))
      : Text('$teamBScore', style: TextStyle(fontSize: 150));

  ElevatedButton addpoint(int pointNum, String team) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (team == 'A') {
            teamAScore += pointNum;
            if (teamAScore > 99) teamAScore = 99;
          } else {
            teamBScore += pointNum;
            if (teamBScore > 99) teamBScore = 99;
          }
        });
      },
      child: Text('Add $pointNum Point'),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          minimumSize: Size(140, 50)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Points Counter'),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Team A',
                        style: TextStyle(fontSize: 40),
                      ),
                      showRes('A'),
                      addpoint(1, 'A'),
                      SizedBox(
                        height: 15,
                      ),
                      addpoint(2, 'A'),
                      SizedBox(
                        height: 15,
                      ),
                      addpoint(3, 'A'),
                    ],
                  ),
                  VerticalDivider(
                    thickness: 1,
                    width: 20,
                    color: Colors.grey,
                    indent: 50,
                    endIndent: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Team B',
                        style: TextStyle(fontSize: 40),
                      ),
                      showRes('B'),
                      addpoint(1, 'B'),
                      SizedBox(height: 15),
                      addpoint(2, 'B'),
                      SizedBox(height: 15),
                      addpoint(3, 'B'),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    teamAScore = 0;
                    teamBScore = 0;
                  });
                },
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    minimumSize: Size(150, 40)))
          ],
        )),
      ),
    );
  }
}
