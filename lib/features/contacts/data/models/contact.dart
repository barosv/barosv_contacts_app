import 'package:objectbox/objectbox.dart';

@Entity()
class Contact {
  int id;

  @Property()
  String contactID;
  @Property()
  String firstName;
  @Property()
  String lastName;
  @Property()
  String phoneNumber;
  @Property()
  String streetAddress1;
  @Property()
  String streetAddress2;
  @Property()
  String city;
  @Property()
  String state;
  @Property()
  String zipCode;

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
      id: 0,
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

  Map<String, dynamic> toJson() {
    return {
      'contactID': contactID,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'streetAddress1': streetAddress1,
      'streetAddress2': streetAddress2,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    };
  }
}
