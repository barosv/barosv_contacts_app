import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';

import 'index.dart';

class ContactForm extends StatefulWidget {
  final Contact contact;
  final bool isNew;
  final ValueChanged<Contact> onChanged;

  const ContactForm({
    super.key,
    required this.contact,
    required this.isNew,
    required this.onChanged,
  });

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  // View elements
  final divider = const SizedBox(height: 40.0);

  // Text controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // View notifiers
  late ValueNotifier<bool> _phoneNotifier;
  late ValueNotifier<bool> _addressNotifier;

  late Contact _contact;

  @override
  void initState() {
    _contact = widget.contact;

    _firstNameController.text = _contact.firstName;
    _lastNameController.text = _contact.lastName;

    _phoneNotifier = ValueNotifier(!widget.isNew);
    _addressNotifier = ValueNotifier(!widget.isNew);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNotifier.dispose();
    _addressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            children: [
              // FIRST NAME
              TextFormField(
                controller: _firstNameController,
                autofocus: true,
                onChanged: (value) {
                  _contact.firstName = value;
                  widget.onChanged(_contact);
                },
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.firstName,
                ),
              ),
              const SizedBox(height: 1),

              // LAST NAME
              TextFormField(
                controller: _lastNameController,
                onChanged: (value) {
                  _contact.lastName = value;
                  widget.onChanged(_contact);
                },
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.lastName,
                ),
              ),
            ],
          ),
        ),

        divider,

        // PHONE NUMBER
        ValueListenableBuilder(
          valueListenable: _phoneNotifier,
          builder: (context, value, child) {
            if (!value) {
              return NewField(
                label: AppLocalizations.of(context)!.addPhone,
                onTap: () => _phoneNotifier.value = true,
              );
            }

            return Segment(
              content: PhoneForm(
                value: _contact.phoneNumber,
                onChanged: (value) {
                  _contact.phoneNumber = value;
                  widget.onChanged(_contact);
                },
              ),
              hint: AppLocalizations.of(context)!.phoneNumber,
              label: AppLocalizations.of(context)!.mobile,
              onDelete: () {
                _contact.phoneNumber = '';
                _phoneNotifier.value = false;
              },
            );
          },
        ),

        divider,

        // ADDRESS
        ValueListenableBuilder(
          valueListenable: _addressNotifier,
          builder: (context, value, child) {
            if (!value) {
              return NewField(
                label: AppLocalizations.of(context)!.addAddress,
                onTap: () => _addressNotifier.value = true,
              );
            }

            return Segment(
              content: AddressForm(contact: _contact),
              hint: AppLocalizations.of(context)!.phoneNumber,
              label: AppLocalizations.of(context)!.home,
              onDelete: () {
                _contact.streetAddress1 = '';
                _contact.streetAddress2 = '';
                _contact.city = '';
                _contact.state = '';
                _contact.zipCode = '';
                _addressNotifier.value = false;
              },
            );
          },
        ),
      ],
    );
  }
}
