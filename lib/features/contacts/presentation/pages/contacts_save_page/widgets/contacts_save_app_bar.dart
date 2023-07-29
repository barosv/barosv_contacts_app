import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ContactsSaveAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onSave;
  @override
  final Size preferredSize;

  const ContactsSaveAppBar({
    super.key,
    required this.onSave,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(AppLocalizations.of(context)!.newContact),
      leading: Row(
        children: [
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () => context.pop(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
      leadingWidth: 100.0,
      actions: [
        InkWell(
          onTap: onSave,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.done,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
