import 'package:barosv_contacts_app/shared/color_constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      appBarTheme: _appBarTheme(),
      iconTheme: _iconTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      listTileTheme: _listTileTheme(),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: _textTheme(),
    );

AppBarTheme _appBarTheme() => const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.blue),
    );

IconThemeData _iconTheme() => const IconThemeData(color: Colors.white);

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.transparent),
      ),
      fillColor: secondaryColorDark,
      filled: true,
      isDense: true,
      hintStyle: TextStyle(color: Colors.grey.shade600),
      iconColor: Colors.grey,
    );

ListTileThemeData _listTileTheme() => const ListTileThemeData(
      textColor: Colors.white,
    );

TextTheme _textTheme() => const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    );
