import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/homepage.dart';
import 'package:hospital_management/screens/login-screen.dart';
//import 'package:sample_firebase_project_authentication/screens/home_screen.dart';
//import 'package:sample_firebase_project_authentication/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((value) {
        if (value == null) {
          //not logged in
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
              (Route<dynamic> rr) => false);
        } else {
          //logged in
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Homepage()),
              (Route<dynamic> rr) => false);
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          "assets/splash_icon2.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
