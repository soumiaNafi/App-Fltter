import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Google Maps'),
        leading: Icon(FontAwesomeIcons.globe),
      ),
      body: Container(color: Colors.white),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Hello World "),
        tooltip: 'Get Location',
        child: Icon(FontAwesomeIcons.mapMarked),
      ),
    );
  }
}
