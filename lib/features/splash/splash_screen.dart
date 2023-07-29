import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/domain/contacts_controller.dart';
import 'package:barosv_contacts_app/injections/injection.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart'
    show contactsListPageId;

class SplashPage extends StatefulWidget {
  static const String id = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _close = false;

  @override
  void initState() {
    super.initState();

    int seconds = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = seconds + 1;

      if (_close && seconds >= 3) {
        timer.cancel();
        _goToSearch();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    await getIt.get<ContactsController>().initDatabaseFromJSON();
    _close = true;
  }

  void _goToSearch() {
    context.go(contactsListPageId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.workspaces,
                color: Colors.blue,
                size: 150.0,
              ),
              SizedBox(height: 70.0),
              Text(
                'Osvaldo\'s',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'Contacts List App',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
