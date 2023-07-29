import 'package:flutter/material.dart' show debugPrint;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:barosv_contacts_app/features/contacts/data/data_sources/local/contacts_data_source.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/repositories/contacts_repository.dart';
import 'package:barosv_contacts_app/injections/injection.dart';

class ContactsController {
  Future<void> initDatabaseFromJSON() async {
    // Checks if JSON was already added to the Database
    final jsonContactsAdded =
        getIt.get<SharedPreferences>().getBool('jsonContactsAdded') ?? false;

    if (jsonContactsAdded) {
      debugPrint('JSON file Contacts were already added to the database');
      return;
    }

    // Reads JSON file
    final contactsDataSource = ContactsDataSource();
    List<Contact> contacts = await contactsDataSource.readContactsFromJson();

    // Saves all contacts in the Database
    final contactsIds = getIt.get<ContactsRepository>().saveContacts(contacts);

    // Updates all Contacts IDs
    for (int contactindex = 0; contactindex < contacts.length; contactindex++) {
      contacts[contactindex].id = contactsIds[contactindex];
    }
    debugPrint('JSON file Contacts added to the database');

    // Indicates that the JSON is now added to the Database
    getIt.get<SharedPreferences>().setBool('jsonContactsAdded', true);
  }

  getNextContacts({String search = ''}) async {}
}
