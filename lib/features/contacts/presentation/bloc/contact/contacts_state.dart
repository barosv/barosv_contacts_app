import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';

abstract class ContactsState {
  final Contact? contact;
  final List<Contact>? contacts;

  const ContactsState({this.contact, this.contacts});
}

class ContactsLoading extends ContactsState {
  const ContactsLoading();
}

class ContactsDone extends ContactsState {
  const ContactsDone(List<Contact> contacts) : super(contacts: contacts);
}

class ContactDone extends ContactsState {
  const ContactDone(Contact? contact) : super(contact: contact);
}
