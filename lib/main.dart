import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(DiceRollApp());
}

class DiceRollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roll'),
        ),
        body: DiceRollScreen(),
      ),
    );
  }
}

class DiceRollScreen extends StatefulWidget {
  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset('assets/$dice1.svg', height: 100, width: 100),
              SvgPicture.asset('assets/$dice2.svg', height: 100, width: 100),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: rollDice,
            child: Text('Roll Dice'),
          ),
          SizedBox(height: 20),
          Text('Total Sum: ${dice1 + dice2}'),
        ],
      ),
    );
  }
}
