import 'package:flutter/material.dart';

class DDonor extends StatefulWidget {
  //const DDonor({ Key? key }) : super(key: key);

  @override
  _DDonorState createState() => _DDonorState();
}

class _DDonorState extends State<DDonor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Donor Profile"),
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
            child: Text(
              "DELETE ACCOUNT",
              style: TextStyle(
                //shadows: ,
                color: Colors.teal,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 100,
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
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ElevatedButton(
              //color: Colors.teal,

              style: ElevatedButton.styleFrom(
                primary: Colors.indigo[500],
                elevation: 7,
                shadowColor: Colors.blue,
              ),
              onPressed: () {
                //update();
              },
              child: Text("          DELETE         "),
              //textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
