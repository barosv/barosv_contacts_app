import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        isDense: true,
        fillColor: Colors.grey.shade900,
        filled: true,
        iconColor: Colors.grey,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.white,
      ),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
      ),
    );
