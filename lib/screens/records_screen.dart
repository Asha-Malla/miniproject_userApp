import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/screens/upload_records.dart';

class Records extends StatefulWidget {
  //const Records({ Key? key }) : super(key: key);

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Records"),
        elevation: 10,
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('app_users/' +
                FirebaseAuth.instance.currentUser.email +
                '/records')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.data.docs.length == 0) {
            return Text("No Data");
          }
          return ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      shadowColor: Colors.teal,
                      elevation: 10,
                      child: Column(
                        children: [
                          Image.network(
                              snapshot.data.docs[index].data()["imgurl"]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data.docs[index].data()["des"],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                );

                /* Card(
                  child: ListTile(
                    leading: Image.network(
                      snapshot.data.docs[index].data()["imgurl"],
                    ),
                    title: Text(
                      snapshot.data.docs[index].data()["des"],
                    ),
                  ),
                );*/
              });
        },
      ),
      /*Container(
            alignment: Alignment.topCenter,
            child: Text(
              "UPLOAD REPORTS",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),*/

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => UploadRecords())),
        },
      ),
    );
  }
}
