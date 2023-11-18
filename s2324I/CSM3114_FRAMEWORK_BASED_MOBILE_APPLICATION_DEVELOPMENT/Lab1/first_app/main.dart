/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Time & Date: 03:00 - 20/10/2023
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme:
        ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueAccent),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('CSM3114 Course'),
      ),
      body: const Center(
        child: Text(
          'Welcome to CSM3114 cousre',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    ),
  ));
}