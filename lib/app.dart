import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barosv_contacts_app/config/theme/app_theme.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/router.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsBloc>(
      create: (context) => ContactsBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Barosv Contacts List',
        theme: theme(),
        routerConfig: router,
      ),
    );
  }
}
