// import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';

// class Quiz extends StatelessWidget{
//   final List<Map<String, Object>> questions;
//   final Function answerQuestion;
//   final int questionIndex;

//   const Quiz(
//     {Key? key,
//      required this.questions,
//      required this.answerQuestion,
//      required this.questionIndex,
//     }
//   )
//   :super (key: key);

//  @override
//  Widget build (BuildContext context){
//   return Column(
//           children: [
//             Question(questions[questionIndex]['questionText'] as String,),
//             ...(questions[questionIndex]['answers'] as List<String>).map((answer){
//               return Answer(
//                 ()=> answerQuestion(answer['score']),answer['text'].toString()
//               );
//             }).toList(),
//           ],
//         );
//  } 
// }
import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List <Map<String, Object>> questions;
  //Final VoidCallback answerQuestion;

  // 29 October 2023 - Added by Hazim Shakri
  // Purpose: To rectify an error when calling VoidCallBaack when use Flutter Version 3.00 and above...
  // Flutter version...

  final Function answerQuestion;

  final int questionIndex;

  const Quiz(
    {Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex})
    : super(key: key);

    @override
    Widget build(BuildContext context){
      return Column(
        children: [
          Question(
            questions[questionIndex]['questionText'] as String,
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer){
            return Answer(
              () => answerQuestion(answer['score']), answer['text'].toString()
            );
          }).toList()
        ],
      );
    }

}