import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ContactButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: secondaryColorDark,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            Text(
              label,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
