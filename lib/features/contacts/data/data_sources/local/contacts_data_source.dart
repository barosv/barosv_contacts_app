import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';

class ContactsDataSource {
  Future<List<Contact>> readContactsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/data/contacts.json');
    final contactsJson = json.decode(jsonString) as List<dynamic>;
    return contactsJson.map((json) => Contact.fromJson(json)).toList();
  }
}
