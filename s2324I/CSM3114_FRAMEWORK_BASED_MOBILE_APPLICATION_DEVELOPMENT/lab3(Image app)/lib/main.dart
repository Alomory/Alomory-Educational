/*
Name: Omar Ismail Alomory
Program: Mobile Computing
Date: 29/10/2023
*/
//exercise 3.4
import 'package:flutter/material.dart';

void main() => runApp(PenguinApp());

class PenguinApp extends StatefulWidget {
  const PenguinApp({super.key});

  @override
  State<StatefulWidget> createState() => _PenguinApp();
}

class _PenguinApp extends State<PenguinApp> {
  int currentImageIndex = 0;
  List<String> imagePaths = ['./images/small.jpeg', './images/big.jpeg'];
  List<String> imageText = ['We are just kids 🥲', 'Finally we grow up 😊'];

  // old method that use only one button to swap the two images
  // void swapImage() { 
  //   setState(() {
  //     currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
  //   });
  // }

  // switching between the two images
  void smallPenguinButton() => setState(() {currentImageIndex = 0; });
  void bigPenguinButton() =>setState(() { currentImageIndex = 1;});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Penguin App'),
            centerTitle: true,
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage(imagePaths[currentImageIndex])),
                  const SizedBox(height: 20),
                  Text(
                    imageText[currentImageIndex],
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: smallPenguinButton,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors
                              .amber), // Change the button's background color
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          // Change the button's text color
                        ),
                        child: const Text('Small Penguin'),
                      ),
                      ElevatedButton(
                        onPressed: bigPenguinButton,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors
                              .amber), // Change the button's background color
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          // Change the button's text color
                        ),
                        child: const Text('Big Penguin'),
                      )
                    ],
                  )
                ]),
          )),
    ));
  }
}
// ps. the remaining tasks/exercises are below











//3.4 Exercise
// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[500],
//         appBar: AppBar(
//           title: const Text('My Application Shafiq'),
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey[900],
//         ),  
//         body: const Center(
//           child: Image(
//             image: AssetImage('images/big.jpg'
//                 ''),
//           ),
//         ),
//       ),
//     ));


// // 3.3
// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[500],
//         appBar: AppBar(
//           title: const Text('My Application Shafiq'),
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey[900],
//         ),
//         body: const Center(
//           child: Image(
//             image: AssetImage('images/background1.jpeg'
//                 ''),
//           ),
//         ),
//       ),
//     ));


/*
3.1

import 'package:flutter/material.dart';

// 3.1
void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[500],
        appBar: AppBar(
          title: const Text('My Application'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
          image: NetworkImage(
              'https://images.pexels.com/photos/18687546/pexels-photo-18687546/free-photo-of-a-green-surfboard-on-a-wooden-pier-overlooking-the-ocean.jpeg'),
        ),
        ) ,
      ),
    ));

*/






// import 'package:flutter/material.dart';

// // Exercise 2.2
// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[500],
//         appBar: AppBar(
//           title: const Text('My Application'),
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey[900],
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Welcome to CSM3114 course..!',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, color: Colors.white),
//             ),
//             ElevatedButton(
//               onPressed: () => {print('Lets Start Button is Clicked')},
//               child: const Text(
//                 'Lets start..',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 30, color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));





// import 'package:flutter/material.dart';

// // Exercise 2.1
// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[500],
//         appBar: AppBar(
//           title: const Text('My Application'),
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey[900],
//         ),
//         body: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Welcome to CSM3114 course..!',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25, color: Colors.white),
//             ),
//             Text(
//               'Lets start..',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     ));
