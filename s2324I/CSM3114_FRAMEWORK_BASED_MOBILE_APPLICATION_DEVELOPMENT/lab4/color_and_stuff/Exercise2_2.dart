/*
 * Name: Omar Alomory
 * Program: Mobile Computing 
 * Date: 3/11/2023
 */

import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyCustom()));

class MyCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCusotm();
}

class _MyCusotm extends State<MyCustom> {
  String defaultText = 'My text';
  String temp = 'Mobile Framework';
  void changeText() {
    setState(() {
      String tempHere = defaultText;
      defaultText = temp;
      temp = tempHere;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Change Text'),
          centerTitle: true,
        ),
        body: Center( child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text(defaultText, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              print(defaultText);
              changeText();
            },
            child: const Text('Add Transaction'),
          ),
        ]),)
      );
}
