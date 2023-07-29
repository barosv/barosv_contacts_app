import 'package:flutter/material.dart';

class ContactsViewPage extends StatelessWidget {
  const ContactsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Contact view'),
        ),
      ),
    );
  }
}
