import 'package:objectbox/objectbox.dart';

@Entity()
class Contact {
  int id;

  final String contactID;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String streetAddress1;
  final String streetAddress2;
  final String city;
  final String state;
  final String zipCode;

  Contact({
    required this.id,
    required this.contactID,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.streetAddress1,
    required this.streetAddress2,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      contactID: json['contactID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      streetAddress1: json['streetAddress1'],
      streetAddress2: json['streetAddress2'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
    );
  }
}
