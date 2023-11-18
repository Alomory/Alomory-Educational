/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Time & Date: 03:00 - 20/10/2023
*/

// Task 4.2 (Exercise)
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueAccent,),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('CSM3114 Course'),
      ),
      body: const Center(
        child: Text('Welcome to CSM3114 course'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        ),
    ),
  ));
}



//Task 2
// import 'package:flutter/material.dart';

// void main(){
//   const myName = 'Omar'; // a- Define my name
//   runApp( const Center(
//     child: Text(
//       'Welcome to My Flutter App $myName ..!',
//       textDirection: TextDirection.ltr,
//       style: TextStyle(
//         fontSize: 20, // b- Change font-size to 20
//         color: Colors.orangeAccent,  // c- Change Color to orange accent
//         fontStyle: FontStyle.italic, // d- Change font-style to italic
//         ),
//     ),
//   ));
// }

// Task 4.2
//1
// import 'package:flutter/material.dart';

// void main(){
//   runApp(const MaterialApp(
//     home: Text('Welcome to CSM3114',style: TextStyle(fontStyle:FontStyle.italic))
//   ));
// }

//2
// import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('CSM3114 Course'),
//       ),
//       body: const Center(
//         child: Text('Welcome to CSM3114 course'),
//       ),
//     ),
//   ));
// }

//3 
// import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(
//     theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueAccent,),
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('CSM3114 Course'),
//       ),
//       body: const Center(
//         child: Text('Welcome to CSM3114 course'),
//       ),
//     ),
//   ));
// }