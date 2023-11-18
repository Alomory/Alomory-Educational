/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Date: 9/11/2023
*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulApp(),
    );
  }
}

class MyStatefulApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulApp();
}

class _MyStatefulApp extends State<MyStatefulApp> {
  String inputText = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stateful App'),
        centerTitle: true,
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(hintText: "Enter text here...!"),
          onChanged: (value) => {
          setState((){
            inputText = value;
          })
        },),
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text('Your text is : $inputText'),
      ) ,
    );
  }
}
