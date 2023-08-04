import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/domain/contacts_controller.dart';
import 'package:barosv_contacts_app/injections/injection.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';

import 'widgets/index.dart';

class ContactsViewPage extends StatelessWidget {
  final Contact? contact;

  const ContactsViewPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final letters = getIt.get<ContactsController>().getContactLetters(contact);

    final newContact = Contact(
      id: contact!.id,
      contactID: contact!.contactID,
      firstName: contact!.firstName,
      lastName: contact!.lastName,
      phoneNumber: contact!.phoneNumber,
      streetAddress1: contact!.streetAddress1,
      streetAddress2: contact!.streetAddress2,
      city: contact!.city,
      state: contact!.state,
      zipCode: contact!.zipCode,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () => context.push(
                contactsSavePageId,
                extra: newContact,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.edit,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
          ],
          leading: InkWell(
            onTap: () => context.go(contactsListPageId),
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                const Icon(
                  CupertinoIcons.back,
                  color: Colors.blue,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.contacts,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: 150.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: contact == null
              ? const ContactError()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      LogoAndName(
                        letters: letters ?? '--',
                        name: '${contact!.firstName} ${contact!.lastName}',
                      ),
                      const ContactButtons(),

                      // NAME
                      Segment(
                        content: Text(
                          contact!.phoneNumber,
                          style: const TextStyle(color: Colors.blue),
                        ),
                        label: AppLocalizations.of(context)!.mobile,
                      ),
                      const SizedBox(height: 15.0),

                      // ADDRESS
                      AddressSegmenet(contact: contact!),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
