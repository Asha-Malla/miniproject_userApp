//import 'dart:html';

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'book-screen.dart';

class DoctorScreen extends StatefulWidget {
  //const DoctorScreen({ Key? key }) : super(key: key);
  String pincode, ctg;
  DoctorScreen({this.pincode, this.ctg});

  @override
  _DoctorScreenState createState() => _DoctorScreenState(pincode, ctg);
}

class _DoctorScreenState extends State<DoctorScreen> {
  String pincode, ctg;
  _DoctorScreenState(this.pincode, this.ctg);
  QuerySnapshot querySnapshot;
  List docs = [];
  @override
  Widget build(BuildContext context) {
    fetchData() async {
      //QuerySnapshot querySnapshot;
      //List docs = [];

      try {
        FirebaseFirestore.instance.collectionGroup('doctors');
        querySnapshot = await FirebaseFirestore.instance
            .collection('doctors')
            .orderBy("d_id")
            .where("d_id", isGreaterThan: pincode + "00000")
            .where("d_id", isLessThanOrEqualTo: pincode + "999999")
            .where("d_area", isEqualTo: ctg)
            .get();
        /* .doc("530027001")
            .collection('doctors')
            .get();
        
            .orderBy("h_id")
            .where("h_id", isGreaterThan: pincode + "000")
            .where("h_id", isLessThan: pincode + "999")
            .get();*/
        //.startAt(["530027000"]).get(); //.orderBy('password')
        if (querySnapshot.docs.isNotEmpty) {
          //print(querySnapshot.docs.runtimeType);
          //print(querySnapshot.docs.toList());
          for (var docu in querySnapshot.docs.toList()) {
            print(docu.data());
            //print(docu.id);
            //print(docu['password']);
            /* return Scaffold(
              body: Row(
                children: [Text(docu.id), Text(docu['password'])],
              ),
            );*/
            /* a = {
              "id": docu.id,
              "mail": docu['mail'],
              "password": docu["password"]
            };
            docs.add(a);*/
          }
          docs = querySnapshot.docs.toList();
          return docs;
        } else {
          Fluttertoast.showToast(msg: "error occured1");
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "error occured2");
        print(e);
      }
    }

    fetchData();
    //print(pincode);
    //print(ctg);
    //var l = fetchData();
    //print(docs);
    return Scaffold(
      appBar: AppBar(
          title: Text("Info"),
          elevation: 10,
          shadowColor: Colors.teal,
          backgroundColor: Colors.teal),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('doctors').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              //print("Hi");
              // print(docs[index]["email"]);
              //print(docs[index]["password"]);
              return Card(
                elevation: 5,
                shadowColor: Colors.teal,
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name                :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["d_name"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Specialization :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["d_specialization"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Category          :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["d_area"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Experience      :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["d_age"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      //Text("Name: " + docs[index]["name"]),
                      //Text("Phone: " + docs[index]["phone"]),
                      //Text("Date: " + docs[index]["date"]),
                      //Text("Blood Type: " + docs[index]["bloodtype"]),
                      Row(
                        children: [
                          Text(
                            "Hospital           :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["h_name"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Doctor ID         :",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            docs[index]["d_id"],
                            style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Row(
            children: [
              Icon(Icons.add),
              Text("book appointment"),
            ],
          ),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => BookScreen())),
              }),*/
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton.extended(
          elevation: 10,
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => BookScreen()));
          },
          icon: Icon(
            Icons.add,
          ),
          label: Text(
            "Book Appointment",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        );
      }),
    );
  }
}
