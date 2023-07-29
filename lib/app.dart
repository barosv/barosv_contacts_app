import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/router.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Barosv Contacts List',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      routerConfig: router,
    );
  }
}
