import 'package:flutter/material.dart';
import 'package:hospital_management/maps.dart';
import 'package:hospital_management/profile.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    StartingPage(),
    Map(),
    Center(
      child: Text(
        'Appointments',
      ),
    ),
    Center(
      child: Text(
        'Records',
      ),
    ),
    Center(
      child: Text(
        'donate',
      ),
    ),
    ProfileApp(),
  ];

  List<BottomNavigationBarItem> navigation_bar_list = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Map',
      icon: Icon(
        Icons.map,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Appointments',
      icon: Icon(
        Icons.book,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Records',
      icon: Icon(
        Icons.date_range,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Donate',
      icon: Icon(
        Icons.local_hospital,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.person,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[600],
        currentIndex: pageIndex,
        elevation: 40,
        selectedItemColor: Colors.lightBlue,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: navigation_bar_list,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F3F8),
        child: Center(
          child: _widgetOptions[pageIndex],
        ),
      ),
    );
  }
}

class StartingPage extends StatefulWidget {
  StartingPage({Key key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  List<AssetImage> images = [
    AssetImage('assets/hosp_image.png'),
    AssetImage('assets/sleeping.png'),
    AssetImage('assets/healthy_food.png'),
    AssetImage('assets/exercise.jpg'),
    AssetImage('assets/vitamins.png'),
    AssetImage('assets/water_drinking.png')
  ];

  List<String> content = [
    'Health is a state of physical, mental and social well-being in which disease and infirmity are absent',
    'Sleep is a vital, often neglected, component of every person\'s overall health and well-being. Sleep is important because it enables the body to repair and be fit and ready for another day. Getting adequate rest may also help prevent excess weight gain, heart disease, and increased illness duration',
    'Do not forget to eat breakfast and choose a nutritious meal with more protein and fiber and less fat, sugar, and calories. For more information on weight-control foods and dietary recommendations consult the Doctor',
    'When you exercise, heart rate increases to circulate more oxygen (via the blood) at a quicker pace. The more you exercise, the more efficient the heart becomes at this process, so you can work out harder and longer. Eventually, this lowers resting heart rate in fit people.',
    'Your body needs vitamin D to absorb calcium. Calcium keeps your bones and muscles—including your heart—healthy and strong. People who do not get enough calcium and vitamin D throughout life have an increased chance of having thin and brittle bones (osteoporosis) in their later years.',
    'Drinking enough water each day is crucial for many reasons: to regulate body temperature, keep joints lubricated, prevent infections, deliver nutrients to cells, and keep organs functioning properly. Being well-hydrated also improves sleep quality, cognition, and mood.',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            /*leading: IconButton(
              icon: Icon(
                Icons.west,
                color: Colors.white,
              ),
              onPressed: () {
                Homepage();
              },
            ),*/
            title: Text(
              '  WELCOME!!!!',
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 80),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFf2F3F8),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: Colors.grey,
                ),
              );
            },
            physics: BouncingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      content[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
