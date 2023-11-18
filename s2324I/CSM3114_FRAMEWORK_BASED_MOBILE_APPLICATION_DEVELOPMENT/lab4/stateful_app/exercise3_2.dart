/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Date: 9/11/2023
*/

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Center(child: Counter()),
      ),
    ));

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
    print("Debug: count = $_count");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: _increment, child: const Text('Press the Button..!')),
        Text("You pressed the button $_count times")
      ],
    );
  }
}
