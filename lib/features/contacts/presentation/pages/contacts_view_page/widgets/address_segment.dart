import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';

import 'address_line.dart';
import 'segment.dart';

class AddressSegmenet extends StatelessWidget {
  final Contact contact;

  const AddressSegmenet({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 5.0);
    return Segment(
      label: AppLocalizations.of(context)!.address,
      content: Column(
        children: [
          // STREET ADDRESS 1
          AddressLine(
            label: AppLocalizations.of(context)!.streetAddress1,
            value: contact.streetAddress1,
          ),
          divider,

          // STREET ADDRESS 2
          AddressLine(
            label: AppLocalizations.of(context)!.streetAddress2,
            value: contact.streetAddress2,
          ),
          divider,

          // CITY
          AddressLine(
            label: AppLocalizations.of(context)!.city,
            value: contact.city,
          ),

          divider,

          // STATE
          AddressLine(
            label: AppLocalizations.of(context)!.state,
            value: contact.state,
          ),
          divider,

          // ZIP CODE
          AddressLine(
            label: AppLocalizations.of(context)!.zipCode,
            value: contact.zipCode,
          ),

          divider,
        ],
      ),
    );
  }
}
