/*
 * Name: Omar Alomory
 * Program: Mobile Computing 
 * Date: 3/11/2023
 */

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rows & Columns'),
          centerTitle: true,
        ),
        body: MyWidget(),
      ),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ), //Container
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ), //Container
      Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    ]) //Column
        ); //Row
  }
}
