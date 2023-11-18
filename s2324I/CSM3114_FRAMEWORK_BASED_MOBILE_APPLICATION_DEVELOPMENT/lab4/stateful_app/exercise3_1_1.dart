/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Date: 9/11/2023
*/

import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _MyApp() ; 
}

class _MyApp extends State<MyApp>{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
  
}