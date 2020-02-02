import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  appBarTheme: AppBarTheme(
    color: Color(0xff1565c0),
  ),
  primaryColor: Colors.indigo,
  scaffoldBackgroundColor: const Color(0xff1565c0),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xff1565c0),
  bottomAppBarTheme:
      BottomAppBarTheme(color: Color(0xff1565c0), elevation: 0.0),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Color(0xff1565c0)),
  hintColor: Color(0xff1565c0),
  dividerColor: Colors.black12,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Color(0xff1565c0), fontSize: 24.0),
  ),
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  primaryIconTheme: IconThemeData(
    color: Color(0xff03a9f4),
  ),
  iconTheme: IconThemeData(
    color: Color(0xff03a9f4),
  ),
  backgroundColor: const Color(0xFFe3f2fd),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
