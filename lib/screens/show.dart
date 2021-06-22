import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowScreen extends StatefulWidget {
  //const ShowScreen({ Key? key }) : super(key: key);
  String bg;
  ShowScreen({Key key, @required this.bg}) : super(key: key);
  @override
  _ShowScreenState createState() => _ShowScreenState(bg);
}

class _ShowScreenState extends State<ShowScreen> {
  String bg;
  _ShowScreenState(this.bg);
  QuerySnapshot querySnapshot;
  List docs = [];
  @override
  Widget build(BuildContext context) {
    fetchData() async {
      //QuerySnapshot querySnapshot;
      //List docs = [];

      try {
        querySnapshot = await FirebaseFirestore.instance
            .collection('blood_donation')
            .where('bloodtype', isEqualTo: bg)
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
    print(bg);
    //var l = fetchData();
    //print(docs);
    return Scaffold(
        appBar: AppBar(
            title: Text("Info"),
            elevation: 10,
            shadowColor: Colors.teal,
            backgroundColor: Colors.teal),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('blood_donation')
                .snapshots(),
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
                                "Name          :",
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
                                "Phone         :",
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
                                "Date            :",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                docs[index]["date"],
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
                                "Blood Type :",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                docs[index]["bloodtype"],
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
                                "Address      :",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                docs[index]["address"],
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
            }));
  }
}
