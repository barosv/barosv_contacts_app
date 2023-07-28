import 'package:flutter/material.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Material App Screen'),
          ),
        ),
      ),
    );
  }
}
