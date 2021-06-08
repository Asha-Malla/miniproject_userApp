//import 'dart:html';
import 'dart:ui';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  //const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _name, _phone, _date, _address;
  String _email = FirebaseAuth.instance.currentUser.email;

  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              '  PROFILE',
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Color(0xFFF2F3F8),
          body: SingleChildScrollView(
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
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.white.withOpacity(
                              0.8,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.teal[100],
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
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
                            /*border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),*/
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
                          keyboardType: TextInputType.text,
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
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[500],
                              elevation: 7,
                              shadowColor: Colors.blue,
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseFirestore.instance
                                    .collection("app_users")
                                    .doc(_email)
                                    .update({
                                  "name": _name,
                                  "phone": _phone,
                                  "date": _date,
                                  "address": _address,
                                });
                                Fluttertoast.showToast(
                                    msg: "successfully updated");
                              } catch (e) {
                                print(e);
                                Text("$e");
                                /*Fluttertoast.showToast(
                                    msg: '$e' +
                                        " $_email " +
                                        "$_name " +
                                        "$_phone " +
                                        "$_address " +
                                        "$_date ");*/
                                Fluttertoast.showToast(msg: "email not found");
                              }
                            },
                            child: Text("            UPDATE PROFILE          "),
                            //textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
