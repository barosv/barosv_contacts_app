import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'contact_button.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(width: 5.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactButton(
            icon: CupertinoIcons.chat_bubble_fill,
            label: AppLocalizations.of(context)!.message,
          ),
          divider,
          ContactButton(
            icon: CupertinoIcons.phone_fill,
            label: AppLocalizations.of(context)!.call,
          ),
          divider,
          ContactButton(
            icon: CupertinoIcons.video_camera_solid,
            label: AppLocalizations.of(context)!.video,
          ),
          divider,
          ContactButton(
            icon: CupertinoIcons.mail_solid,
            label: AppLocalizations.of(context)!.mail,
          ),
        ],
      ),
    );
  }
}
