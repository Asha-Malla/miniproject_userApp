import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CancelScreen extends StatefulWidget {
  //const CancelScreen({ Key? key }) : super(key: key);

  @override
  _CancelScreenState createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  String _app_id;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Donor Profile"),
        elevation: 10,
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Card(
            elevation: 10,
            shadowColor: Colors.teal,
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(35),
                  child: Text(
                    "DELETE APPOINTMENT",
                    style: TextStyle(
                      //shadows: ,
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (item) {
                      setState(() {
                        _app_id = item;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.pink,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.receipt,
                        color: Colors.teal[400],
                        size: 35.0,
                      ),
                      hintText: 'Appointment ID',
                      hintStyle: new TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.teal,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    maxLength: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    //color: Colors.teal,

                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo[500],
                      elevation: 7,
                      shadowColor: Colors.blue,
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection("appointments")
                            .doc(_app_id)
                            .delete();
                        Fluttertoast.showToast(msg: "successfully deleted");
                      } catch (e) {
                        Fluttertoast.showToast(msg: "error occured");
                        print(e);
                      }
                    },
                    child: Text("          DELETE         "),
                    //textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
