import 'package:flutter/material.dart';

class ContactsSearchPage extends StatelessWidget {
  const ContactsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Contacts search'),
        ),
      ),
    );
  }
}
