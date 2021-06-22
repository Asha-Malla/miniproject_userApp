//import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CrU extends StatefulWidget {
  //const CrU({ Key? key }) : super(key: key);

  @override
  _CrUState createState() => _CrUState();
}

class _CrUState extends State<CrU> {
  String _name, _phone, _date, _bloodtype, _address, _email;
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
              'Donor Profile',
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
                      "CREATE OR UPDATE",
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
                                  _date = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Date Of Birth - dd/mm/yyyy',
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
                                  _bloodtype = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.local_hospital_rounded,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Blood type',
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
                                  _address = item;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.teal[400],
                                  size: 35.0,
                                ),
                                hintText: 'Address',
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
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await FirebaseFirestore.instance
                                            .collection('blood_donation')
                                            .doc(_email)
                                            .set({
                                          "name": _name,
                                          "phone": _phone,
                                          "date": _date,
                                          "bloodtype": _bloodtype,
                                          "address": _address,
                                        });
                                        Fluttertoast.showToast(
                                            msg: "successfully created");
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
                                      "      CREATE      ",
                                    ),
                                    // textColor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await FirebaseFirestore.instance
                                            .collection("blood_donation")
                                            .doc(_email)
                                            .update({
                                          "name": _name,
                                          "phone": _phone,
                                          "date": _date,
                                          "bloodtype": _bloodtype,
                                          "address": _address,
                                        });
                                        Fluttertoast.showToast(
                                            msg: "successfully updated");
                                      } catch (e) {
                                        Fluttertoast.showToast(
                                            msg: "email not found");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo[500],
                                      elevation: 7,
                                      shadowColor: Colors.blue,
                                    ),
                                    child: Text("       UPDATE      "),
                                    //textColor: Colors.white,
                                  ),
                                ),
                              ],
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
