//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/screens/view-appointment-screen.dart';

import 'doctor_list.dart';

class AppointmentScreen extends StatefulWidget {
  //const AppointmentScreen({ Key? key }) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String pincode, ctg;
  TextEditingController pin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        elevation: 10,
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                // MaterialPageRoute(builder: (_) => ViewScreen());
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ViewScreen()));
              },
              icon: Icon(
                Icons.visibility,
              ),
              label: Text("View booked appointments here")),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: pin,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.teal,
                  ),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(15),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.place,
                  color: Colors.teal[400],
                  size: 35.0,
                ),
                hintText: 'Enter Pincode',
                hintStyle: new TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.teal,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
              maxLength: 6,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "    GENERAL   ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "    PYSICIAN   ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/doctor.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "general physician";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "PAEDIATRICS",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SvgPicture.asset(
                            "assets/infant.svg",
                            height: 70,
                            width: 70,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "paediatrics";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "DERMATOLOGY",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/dermis.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "dermatology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.all(0),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "CARDIOLOGY",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/heart.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "cardiology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "  ONCOLOGY  ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/pink-ribbon.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "oncology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.all(0),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "GYNAECOLOGY",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SvgPicture.asset(
                            "assets/uterus.svg",
                            height: 70,
                            width: 70,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "gynaecology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(7),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "PULMONOLOGY",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/lungs.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "pulmonology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.all(7),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            " ORTHOPAEDIC ",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/osteoporosis.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "orthopaedic";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "NEUROLOGY",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/brainstorm.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "neurology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            "NEPHROLOGY",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            "assets/kidneys.svg",
                            height: 60,
                            width: 60,
                          )
                        ],
                      ),
                      onTap: () {
                        ctg = "nephrology";
                        pincode = pin.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    DoctorScreen(pincode: pincode, ctg: ctg)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
