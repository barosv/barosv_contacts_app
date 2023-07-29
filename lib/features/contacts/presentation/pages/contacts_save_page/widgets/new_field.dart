import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class NewField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NewField({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        color: secondaryColorDark,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
        child: Row(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 10.0,
                height: 10.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const Icon(
                CupertinoIcons.add_circled_solid,
                color: Colors.green,
              )
            ],
          ),
          const SizedBox(width: 20.0),
          Text(label),
        ]),
      ),
    );
  }
}
