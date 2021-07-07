import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/homepage.dart';
import 'package:hospital_management/screens/login-screen.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {           //to show 5 sec of splash screen
      FirebaseAuth.instance.authStateChanges().listen((value) {   //check user authentication 
        if (value == null) {
          //not logged in
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),  //redirect to login screen if not logged in
              (Route<dynamic> rr) => false);
        } else {
          //logged in
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Homepage()),    //redirect to homepage screen if already logged in
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
          "assets/splash_icon2.png",   //splash screen icon  //displays for 5 secs
          fit: BoxFit.fill,            //fits entire screen
        ),
      ),
    );
  }
}
