import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hospital_management/screens/splash_screen.dart';

void main() async {
  //intializing firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hospital Management App",
      home: SplashScreen(), //Container(),
    );
  }
}
