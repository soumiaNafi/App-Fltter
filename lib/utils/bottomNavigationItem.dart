import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<BottomNavigationBarItem> itemsBar = [
  BottomNavigationBarItem(
    backgroundColor: Color(0xff90caf9),
    icon: Icon(FontAwesomeIcons.home),
    title: Text('Backend'),
  ),
  BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.brain),
    backgroundColor: Color(0xff90caf9),
    title: Text('AI'),
  ),
  BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.cog),
    backgroundColor: Color(0xff90caf9),
    title: Text('Setting'),
  ),
];
