//import 'dart:ui';
import 'package:flutter/material.dart';

class CrU extends StatefulWidget {
  //const CrU({ Key? key }) : super(key: key);

  @override
  _CrUState createState() => _CrUState();
}

class _CrUState extends State<CrU> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              'Donor Profile',
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Color(0xFFF2F3F8),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "CREATE OR UPDATE",
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.teal,
                      fontWeight: FontWeight.w900),
                ),
                Form(
                  child: Container(
                    margin: EdgeInsets.all(35),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),
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
                                //color: Colors.teal,
                                onPressed: () {
                                  //update();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo[500],
                                  elevation: 7,
                                  shadowColor: Colors.blue,
                                ),
                                child: Text(
                                  "         CREATE         ",
                                ),
                                // textColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: ElevatedButton(
                                //color: Colors.teal,
                                onPressed: () {
                                  //update();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo[500],
                                  elevation: 7,
                                  shadowColor: Colors.blue,
                                ),
                                child: Text("          UPDATE         "),
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
        )
      ],
    );
  }
}
