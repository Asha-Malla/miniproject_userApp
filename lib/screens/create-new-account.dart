import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_management/homepage.dart';
import 'package:hospital_management/pallete.dart';
import 'package:hospital_management/screens/login-screen.dart';
import 'package:hospital_management/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String _name, _email, _password;
  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/login_bg.png'),    // background image
        Scaffold(
          backgroundColor: Colors.transparent,
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: CircleAvatar(                                 // User Avathar icon
                                  radius: size.width * 0.14,
                                  backgroundColor: Colors.grey[400].withOpacity(
                                    0.4,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    color: kWhite,
                                    size: size.width * 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.08,
                            left: size.width * 0.56,
                            child: Container(
                              height: size.width * 0.1,
                              width: size.width * 0.1,
                              decoration: BoxDecoration(
                                color: kBlue,
                                shape: BoxShape.circle,
                                border: Border.all(color: kWhite, width: 2),
                              ),
                              child: Icon(
                                FontAwesomeIcons.arrowUp,
                                color: kWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(35),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                onChanged: (item) {
                                  setState(() {
                                    _name = item;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  hintText: "Enter name",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (item) {                            // email validation logic
                                  return item.contains("@")
                                      ? null
                                      : "Enter valid Email";
                                },
                                onChanged: (item) {
                                  setState(() {
                                    _email = item;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (item) {                  // password validation logic
                                  return item.length >= 6
                                      ? null
                                      : "Password must be 6 characters";
                                },
                                onChanged: (item) {
                                  setState(() {
                                    _password = item;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  //labelText: "Email",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    signup(),
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo[500],
                                    //elevation: 7,
                                    //shadowColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: new Text(
                                    '                      REGISTER                       ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: kBodyText,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(                        
                                              builder: (_) => LoginScreen()));            // redirect to login screen
                                    },
                                    child: Text(
                                      'Login',
                                      style: kBodyText.copyWith(
                                          color: kBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        )
      ],
    );
  }

  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)   // creating account with email andpassword
          .then((user) {
        setState(() {
          isLoading = false;
        });                                                          // account created successfully
        Fluttertoast.showToast(msg: "Registration Successful");

        void create() async {
          try {
            await FirebaseFirestore.instance                                               // storing user details in firestore
                .collection('app_users')
                .doc(_email)
                .set({
              "name": _name,
              "phone": "",
              "date": "",
              "address": "",
              "email": _email
            });
            Fluttertoast.showToast(msg: "successfully created");
          } catch (e) {
            Fluttertoast.showToast(msg: "error occured");
          }
        }

        create();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Homepage()),                    // redirect to home page after successful account creation
            (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;                                              // error occured
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }
}
