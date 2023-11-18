/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Date: 9/11/2023
*/

/*
 * Exercise 3.4
 * -------------
 * Create one TextField in your UI
 * Display Exceeded Credit Limit if the value > 50. 
 * Otherwise display Processing, display bold message through text field
 * ------------------------------------------------------------------------------
 */
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Credit Limit"),
          centerTitle: true,
        ),
        body: MyStatefulApp(),
      ),
    ));

class MyStatefulApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulApp();
}

class _MyStatefulApp extends State<MyStatefulApp> {
  String _inputText = 'Test';
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.all(50),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Example 500"),
            onChanged: (value) => {
              setState(() {
                if (value.trim().isNotEmpty) {
                  if (int.parse(value) > 500) {
                    _inputText = 'Exceeded Credit Limit';
                    value = value.trim();
                  } else {
                    _inputText = 'Processing...';
                  }
                }else{
                  _inputText = '';
                }
              })
            },
          ),
        ),
        Container(
            child: Text(
          _inputText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ))
      ]),
    );
  }
}
