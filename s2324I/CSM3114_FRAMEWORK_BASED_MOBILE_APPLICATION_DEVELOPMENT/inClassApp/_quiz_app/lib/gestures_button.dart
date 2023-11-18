import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}



class MyAppState extends State<MyApp> {
  var count = 0 ;
  // This widget is the root of your application.
  void counter (){
    setState(() {
      count+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gestures Button'),
        ),
        body: Column(
          children: [
            Text('$count'),
            MyButton(),
            
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        print('Button Clicked!');
        
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'My Button',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


