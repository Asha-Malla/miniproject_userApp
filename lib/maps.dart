import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Map extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('  Map'),
          backgroundColor: Colors.teal,
        ),
        body: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(17.7439, 83.2283), minZoom: 5.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(17.7439, 83.2283),
                  builder: (context) {
                    var red = Colors.red;
                    return new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker Tapped');
                        },
                      ),
                    );
                  })
            ])
          ],
        ));
  }
}
