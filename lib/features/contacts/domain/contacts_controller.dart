import 'package:flutter/material.dart' show debugPrint;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:barosv_contacts_app/features/contacts/data/data_sources/local/contacts_data_source.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/repositories/contacts_repository.dart';
import 'package:barosv_contacts_app/injections/injection.dart';

class ContactsController {
  Future<void> initDatabaseFromJSON() async {
    // Just for testing
    // getIt.get<ContactsRepository>().deleteAll();
    // getIt.get<SharedPreferences>().setBool('jsonContactsAdded', false);

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
    final contactsIds = getIt.get<ContactsRepository>().createAll(contacts);

    // Updates all Contacts IDs
    for (int contactindex = 0; contactindex < contacts.length; contactindex++) {
      contacts[contactindex].id = contactsIds[contactindex];
    }
    debugPrint('JSON file Contacts added to the database');

    // Indicates that the JSON is now added to the Database
    getIt.get<SharedPreferences>().setBool('jsonContactsAdded', true);
  }

  // Search
  List<Contact> search({String search = ''}) {
    return getIt.get<ContactsRepository>().search(search: search);
  }

  // Get all Contacts
  List<Contact> getAll() => getIt.get<ContactsRepository>().getAll();

  // Get a single Contact
  Contact? get(int id) => getIt.get<ContactsRepository>().get(id);

  // Create a new Contact
  int create(Contact contact) {
    return getIt.get<ContactsRepository>().update(contact);
  }

  // Update a Contact
  int update(Contact contact) {
    return getIt.get<ContactsRepository>().update(contact);
  }

  // Create a new list of Contacts
  List<int> createAll(List<Contact> contacts) {
    return getIt.get<ContactsRepository>().createAll(contacts);
  }

  // Delete a Contact
  bool delete(int id) => getIt.get<ContactsRepository>().delete(id);

  // Delete all
  int deleteAll() => getIt.get<ContactsRepository>().deleteAll();

  // Gets the letters to show instead of an image
  String? getContactLetters(Contact? contact) {
    if (contact == null) return null;

    if (contact.firstName.isEmpty && contact.lastName.isEmpty) return null;

    final firstLetter =
        contact.firstName.isNotEmpty ? contact.firstName[0] : '';
    final secondLetter = contact.lastName.isNotEmpty ? contact.lastName[0] : '';

    return '$firstLetter$secondLetter';
  }
}
