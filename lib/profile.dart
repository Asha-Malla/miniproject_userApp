import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: Profile());
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              '  PROFILE',
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Color(0xFFF2F3F8),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.white.withOpacity(
                              0.8,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.teal[100],
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Form(
                  child: Container(
                    margin: EdgeInsets.all(35),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            /*border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink,
                              ),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15),
                              ),
                            ),*/
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.teal[400],
                              size: 35.0,
                            ),
                            hintText: 'Name',
                            hintStyle: new TextStyle(
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLength: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.teal[400],
                              size: 35.0,
                            ),
                            hintText: 'Phone No.',
                            hintStyle: new TextStyle(
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLength: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.teal[400],
                              size: 35.0,
                            ),
                            hintText: 'Date Of Birth - dd/mm/yyyy',
                            hintStyle: new TextStyle(
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLength: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_sharp,
                              color: Colors.teal[400],
                              size: 35.0,
                            ),
                            hintText: 'Address',
                            hintStyle: new TextStyle(
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLength: 100,
                        ),
                        TextField(
                          decoration: InputDecoration(
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
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[500],
                              elevation: 7,
                              shadowColor: Colors.blue,
                            ),
                            onPressed: () {
                              update();
                            },
                            child: Text("            UPDATE PROFILE          "),
                            //textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void update() {}
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
