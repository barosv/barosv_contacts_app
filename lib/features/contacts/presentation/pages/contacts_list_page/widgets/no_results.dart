import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoResults extends StatelessWidget {
  final String value;
  const NoResults(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.search,
          color: Colors.grey,
          size: 50.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          AppLocalizations.of(context)!.noResults(value),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          AppLocalizations.of(context)!.checkSpelling,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
