import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/domain/contacts_controller.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/injections/injection.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';

import 'widgets/index.dart';

class ContactsSavePage extends StatelessWidget {
  final Contact? contact;

  const ContactsSavePage({
    super.key,
    this.contact,
  });

  @override
  Widget build(BuildContext context) {
    Contact newContact = contact ?? Contact.empty();

    final letters =
        getIt.get<ContactsController>().getContactLetters(newContact);

    return SafeArea(
      child: Scaffold(
        appBar: ContactsSaveAppBar(
          isNew: contact == null,
          onSave: () => _save(context: context, value: newContact),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  radius: 50.0,
                  child: Text(
                    letters ?? '--',
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ContactForm(
                  contact: newContact,
                  isNew: contact == null,
                  onChanged: (value) => newContact = value,
                ),
                if (contact != null) ...[
                  const SizedBox(height: 20.0),
                  DeleteButton(
                    onTap: () => _delete(
                      context: context,
                      value: newContact.id,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save({required BuildContext context, required Contact value}) {
    if (contact == null) {
      context.read<ContactsBloc>().add(Create(contact: value));
    } else {
      context.read<ContactsBloc>().add(Update(contact: value));
    }

    context.push(contactsViewPageId, extra: value);
  }

  void _delete({required BuildContext context, required int value}) {
    context.read<ContactsBloc>().add(Delete(id: value));
    context.go(contactsListPageId);
  }
}
