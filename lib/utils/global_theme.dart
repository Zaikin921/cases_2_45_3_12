import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(

      fontFamily: 'Arial',
      splashColor: Color.fromARGB(181, 121, 35, 1),

      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ).copyWith(
        secondary: Color.fromARGB(250, 241, 227, 1),
      ),

      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      )
  );
