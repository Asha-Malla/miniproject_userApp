import 'package:flutter/material.dart';
import 'package:hospital_management/screens/create-update-donor.dart';
import 'package:hospital_management/screens/delete_donor.dart';
import 'package:hospital_management/screens/find_donor.dart';

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text("Blood donation"),
          elevation: 10,
          shadowColor: Colors.teal,
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Color(0xFFF2F3F8),
      ),
      Center(
        child: Container(
          padding: new EdgeInsets.all(15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          'Create or Update Donor Profile',
                          style: TextStyle(
                              fontSize: 29.5,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text(
                            'Join blood donation and donate blood to save life.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.teal,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CrU()));
                          //CrU();
                          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>CrU())), (route) => false)
                          /*Navigator.push(
                            context, MaterialPageRoute(builder: (_) => CrU()));*/
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Center(
                          child: Text(
                            'Delete Donor',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.teal,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        subtitle:
                            Text('Don\'t want to donate? Cancel any time.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                )),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.teal,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DDonor()));
                          // DDonor();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Center(
                          child: Text(
                            'Find Donors',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.teal,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        subtitle: Text('Find suitable blood type donors here.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.teal,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => FDonor()));
                          //FDonor();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
