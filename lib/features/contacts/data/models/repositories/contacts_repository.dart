import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/objectbox.g.dart';

class ContactsRepository {
  final Box<Contact> _contactsBox;

  ContactsRepository(this._contactsBox);

  // Search
  List<Contact> search({String search = ''}) {
    return _contactsBox
        .query(
          Contact_.firstName.contains(search).or(
                Contact_.lastName.contains(search),
              ),
        )
        .order(Contact_.lastName)
        .order(Contact_.firstName)
        .build()
        .find();
  }

  // Get all Contacts
  List<Contact> getAll() => _contactsBox
      .query()
      .order(Contact_.lastName)
      .order(Contact_.firstName)
      .build()
      .find();

  // Get a single Contact
  Contact? get(int id) => _contactsBox.get(id);

  // Create a new Contact
  int create(Contact contact) => _contactsBox.put(contact);

  // Update a Contact
  int update(Contact contact) => _contactsBox.put(contact);

  // Create a new list of Contacts
  List<int> createAll(List<Contact> contacts) => _contactsBox.putMany(contacts);

  // Delete a Contact
  bool delete(int id) => _contactsBox.remove(id);

  // Delete all
  int deleteAll() => _contactsBox.removeAll();
}
