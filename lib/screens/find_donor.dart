import 'package:flutter/material.dart';

class FDonor extends StatefulWidget {
  //const FDonor({ Key? key }) : super(key: key);

  @override
  _FDonorState createState() => _FDonorState();
}

class _FDonorState extends State<FDonor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Donor "),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(35),
            child: Center(
              child: Text(
                "FIND DONOR BY BLOOD TYPE",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
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
                hintText: 'Enter Blood Group',
                hintStyle: new TextStyle(
                  fontFamily: 'Cairo',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
              maxLength: 20,
            ),
          ),
          SizedBox(
            height: 25,
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
              child: Text("          Find         "),
              //textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
