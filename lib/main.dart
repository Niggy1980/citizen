import 'package:flutter/material.dart';
import 'package:citizen/feature/app/slash_screen/Splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyACXCvQpMex5zbGtHClANTvNeUF50OHKuw",
          appId: "1:66137508951:web:5b524a466b1944f47a2712",
          messagingSenderId: "66137508951",
          projectId: "citizen-project-c3f92",
          storageBucket: "citizen-project-c3f92.appspot.com",));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: splash());
  }
}
