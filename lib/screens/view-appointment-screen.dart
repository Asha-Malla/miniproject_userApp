import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/screens/cancel-screen.dart';

class ViewScreen extends StatefulWidget {
  //const ViewScreen({ Key? key }) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  QuerySnapshot querySnapshot;
  List docs = [];
  @override
  Widget build(BuildContext context) {
    fetchData() async {
      //QuerySnapshot querySnapshot;
      //List docs = [];

      try {
        querySnapshot = await FirebaseFirestore.instance
            .collection('appointments')
            .where('email', isEqualTo: FirebaseAuth.instance.currentUser.email)
            .get(); //.orderBy('password')
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
    //print(bg);
    //var l = fetchData();
    //print(docs);
    return Scaffold(
      appBar: AppBar(
          title: Text("Info"),
          elevation: 10,
          shadowColor: Colors.teal,
          backgroundColor: Colors.teal),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('appointments').snapshots(),
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
                              "Application ID :",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              docs[index]["app_id"],
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
                              docs[index]["name"],
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
                              "Phone               :",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              docs[index]["phone"],
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
                              "Age                   :",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              docs[index]["age"],
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
                              "status               :",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              docs[index]["status"],
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
                              "Symptoms       :",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              docs[index]["symptoms"],
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
          }),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton.extended(
          elevation: 10,
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CancelScreen()));
          },
          label: Text(
            "Cancel Appointment",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        );
      }),
    );
  }
}
