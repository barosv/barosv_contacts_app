import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactsSavePage extends StatelessWidget {
  const ContactsSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('New Contact'),
          leading: InkWell(
            onTap: () => context.pop(),
            child: const Text('Cancel'),
          ),
          actions: [
            InkWell(
              onTap: () => context.pop(),
              child: const Text('Done'),
            ),
          ],
        ),
        body: const Center(
          child: Text('Contacts save'),
        ),
      ),
    );
  }
}
