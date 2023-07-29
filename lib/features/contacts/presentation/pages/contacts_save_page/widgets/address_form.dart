import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_save_page/widgets/index.dart';

class AddressForm extends StatefulWidget {
  final Contact contact;
  final ValueChanged<Contact> onChanged;

  const AddressForm({
    super.key,
    required this.contact,
    required this.onChanged,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  // View elements
  final divider = const SizedBox(height: 0.0);

  late Contact _contact;

  @override
  void initState() {
    _contact = widget.contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // STREET ADDRESS 1
        AddressInput(
          hint: AppLocalizations.of(context)!.streetAddress1,
          textInputType: TextInputType.streetAddress,
          value: _contact.streetAddress1,
          onChanged: (value) => _contact.streetAddress1 = value,
        ),
        divider,

        // STREET ADDRESS 2
        AddressInput(
          hint: AppLocalizations.of(context)!.streetAddress2,
          textInputType: TextInputType.streetAddress,
          value: _contact.streetAddress2,
          onChanged: (value) => _contact.streetAddress2 = value,
        ),
        divider,

        // CITY
        AddressInput(
          hint: AppLocalizations.of(context)!.city,
          value: _contact.city,
          onChanged: (value) => _contact.city = value,
        ),
        divider,

        // STATE
        AddressInput(
          hint: AppLocalizations.of(context)!.state,
          value: _contact.state,
          onChanged: (value) => _contact.state = value,
        ),
        divider,

        // ZIP CODE
        AddressInput(
          hint: AppLocalizations.of(context)!.zipCode,
          textInputType: TextInputType.number,
          value: _contact.zipCode,
          onChanged: (value) => _contact.zipCode = value,
        ),
      ],
    );
  }
}
