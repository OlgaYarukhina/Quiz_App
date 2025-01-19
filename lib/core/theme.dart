import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor:Color.fromARGB(255, 6, 40, 50),
  primarySwatch: Colors.yellow,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color.fromARGB(255, 166, 255, 0)),
    backgroundColor: Color.fromARGB(255, 3, 25, 32),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 166, 255, 0),
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
listTileTheme: const ListTileThemeData()
);