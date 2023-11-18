import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final int resultScore;
  final Function resetHandler;

  Result (this.resultScore, this.resetHandler);

  String get resultPhrase{
    String resulText  = 'You did it ..!';

    if(resultScore <=8){
      resulText = 'You are innocent';
    }else if(resultScore <=12){
      resulText = 'Pretty likeable ..!';
    }else if(resultScore <=16){
      resulText = 'You are strange ..!';
    }else{
      resulText = 'You are so bad..!';
    }
    return resulText;
  }

  @override
  Widget build (BuildContext context){
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight:FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: ()=> resetHandler(), child: const Text('Restart Quiz'))
        ],
      ),

    );
  }
}
/*
 * Name: Omar Alomory
 * Matric No: S63955
 * Program: Mobile Computing 
 * Date: 3/11/2023
 */




