import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'appointment-screen.dart';

class BookScreen extends StatefulWidget {
  //const BookScreen({ Key? key }) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String _name, _phone, _date, _age, _d_id, _symptoms, _email;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 10,
            shadowColor: Colors.teal,
            title: Text(
              'Appointment Booking',
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Color(0xFFF2F3F8),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(19),
              child: Card(
                elevation: 10,
                shadowColor: Colors.teal,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "BOOK NOW",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.teal,
                          fontWeight: FontWeight.w900),
                    ),
                    Form(
                      key: _formkey,
                      child: Container(
                        margin: EdgeInsets.all(35),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _name = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Name',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 20,
                            ),
                            TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _phone = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Phone No.',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 10,
                            ),
                            TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _age = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'age',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 10,
                            ),
                            TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _d_id = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Enter doctor ID',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 100,
                            ),
                            TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _symptoms = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.list,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Symptoms',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 100,
                            ),
                            /*TextFormField(
                              onChanged: (item) {
                                setState(() {
                                  _email = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Email ID',
                                hintStyle: new TextStyle(
                                  fontFamily: 'Cairo',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              maxLength: 20,
                            ),*/

                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    var app_id = FirebaseFirestore.instance
                                        .collection("appointments")
                                        .doc()
                                        .id;
                                    _email =
                                        FirebaseAuth.instance.currentUser.email;
                                    await FirebaseFirestore.instance
                                        .collection('appointments')
                                        .doc(app_id)
                                        .set({
                                      "name": _name,
                                      "phone": _phone,
                                      "date": _date,
                                      "age": _age,
                                      "d_id": _d_id,
                                      "symptoms": _symptoms,
                                      "email": _email,
                                      "app_id": app_id,
                                      "status": "queued",
                                    });
                                    Fluttertoast.showToast(
                                        msg: "successfully created");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                AppointmentScreen()));
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                        msg: "error occured");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo[500],
                                  elevation: 7,
                                  shadowColor: Colors.blue,
                                ),
                                child: Text(
                                  "      BOOK NOW      ",
                                ),
                                // textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
