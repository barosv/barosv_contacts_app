import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/objectbox.g.dart';

class ContactsRepository {
  final Box<Contact> _contactsBox;

  ContactsRepository(this._contactsBox);

  // Get list
  List<Contact> getontacts({String search = ''}) {
    return _contactsBox
        .query(
          Contact_.firstName.contains(search).or(
                Contact_.lastName.contains(search),
              ),
        )
        .order(Contact_.firstName, flags: Order.descending)
        .order(Contact_.lastName, flags: Order.descending)
        .build()
        .find();
  }

  // Get a single Contact
  Contact? getContactById(int id) => _contactsBox.get(id);

  // Create/Update a Contact
  int saveContact(Contact contact) => _contactsBox.put(contact);

  // Create/Update a list of Contacts
  List<int> saveContacts(List<Contact> contacts) =>
      _contactsBox.putMany(contacts);

  // Delete a Contact
  bool deleteContact(int id) => _contactsBox.remove(id);

  // Delete all
  int deleteAll() => _contactsBox.removeAll();
}
