import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';

import 'widgets/index.dart';

class ContactsSavePage extends StatelessWidget {
  const ContactsSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    Contact contact = Contact.empty();
    return SafeArea(
      child: Scaffold(
        appBar: ContactsSaveAppBar(
          onSave: () => _save(context: context, contact: contact),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ContactForm(
              contact: contact,
              onChanged: (value) => contact = value,
            ),
          ),
        ),
      ),
    );
  }

  void _save({required BuildContext context, required Contact contact}) {
    context.read<ContactsBloc>().add(Create(contact: contact));
    context.push(contactsViewPageId, extra: contact);
  }
}
