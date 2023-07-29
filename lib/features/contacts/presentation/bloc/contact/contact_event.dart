import 'package:equatable/equatable.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class Initial extends ContactsEvent {
  const Initial();
}

class Search extends ContactsEvent {
  final String search;
  const Search({required this.search});
}

class GetAll extends ContactsEvent {
  const GetAll();
}

class Get extends ContactsEvent {
  final int id;
  const Get({required this.id});
}

class Create extends ContactsEvent {
  final Contact contact;
  const Create({required this.contact});
}

class CreateAll extends ContactsEvent {
  final List<Contact> contacts;
  const CreateAll({required this.contacts});
}

class Update extends ContactsEvent {
  final Contact contact;
  const Update({required this.contact});
}

class Delete extends ContactsEvent {
  final int id;
  const Delete({required this.id});
}

class DeleteAll extends ContactsEvent {
  const DeleteAll();
}
