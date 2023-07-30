import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_save_page/widgets/index.dart';

class AddressForm extends StatelessWidget {
  final Contact contact;

  const AddressForm({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 0.0);
    return Column(
      children: [
        // STREET ADDRESS 1
        AddressInput(
          hint: AppLocalizations.of(context)!.streetAddress1,
          textInputType: TextInputType.streetAddress,
          value: contact.streetAddress1,
          onChanged: (value) => contact.streetAddress1 = value,
        ),
        divider,

        // STREET ADDRESS 2
        AddressInput(
          hint: AppLocalizations.of(context)!.streetAddress2,
          textInputType: TextInputType.streetAddress,
          value: contact.streetAddress2,
          onChanged: (value) => contact.streetAddress2 = value,
        ),
        divider,

        // CITY
        AddressInput(
          hint: AppLocalizations.of(context)!.city,
          value: contact.city,
          onChanged: (value) => contact.city = value,
        ),
        divider,

        // STATE
        AddressInput(
          hint: AppLocalizations.of(context)!.state,
          value: contact.state,
          onChanged: (value) => contact.state = value,
        ),
        divider,

        // ZIP CODE
        AddressInput(
          hint: AppLocalizations.of(context)!.zipCode,
          textInputType: TextInputType.number,
          value: contact.zipCode,
          onChanged: (value) => contact.zipCode = value,
        ),
      ],
    );
  }
}
