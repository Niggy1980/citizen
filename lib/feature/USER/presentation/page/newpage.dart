import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('rest Api '),
        ),
        body:  Center(
          child: Image.asset("assets/หหห"
            ,

          ),
        ),
      ),
    );

  }
}





