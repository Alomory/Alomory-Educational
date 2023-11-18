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
  bool isButtonPressed = false;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: GestureDetector(
        onTap: ()=> {
          if(isButtonPressed){
            setState((){
              isButtonPressed = false;
            })
          }else{
            setState((){
              isButtonPressed = true;
            })
          }
        },
        child: Container(
        color: getColor(),),
      ),
    );
  }
  Color getColor(){
    print("The button value is $isButtonPressed");
    return (!isButtonPressed)? Colors.red: Colors.yellow;
  }
}