import 'package:flutter/material.dart';
import 'package:hospital_management/screens/show.dart';

class FDonor extends StatefulWidget {
  //const FDonor({ Key? key }) : super(key: key);

  @override
  _FDonorState createState() => _FDonorState();
}

class _FDonorState extends State<FDonor> {
  String bg;
  TextEditingController bgtype = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Donor "),
        elevation: 10,
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Card(
          elevation: 10,
          shadowColor: Colors.teal,
          child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(35),
                child: Center(
                  child: Text(
                    "FIND DONOR BY BLOOD TYPE",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: bgtype,
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
                      Icons.local_hospital_rounded,
                      color: Colors.teal[400],
                      size: 35.0,
                    ),
                    hintText: 'Enter Blood Group',
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
                height: 15,
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: ElevatedButton(
                  //color: Colors.teal,
                  onPressed: () {
                    //update();
                    bg = bgtype.text;
                    //print(bg);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ShowScreen(bg: bg)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[500],
                    elevation: 7,
                    shadowColor: Colors.blue,
                  ),
                  child: Text("          Find         "),
                  //textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
