import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class Segment extends StatelessWidget {
  final Widget content;
  final String label;

  const Segment({
    super.key,
    required this.content,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: secondaryColorDark,
      ),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 5.0),
          content,
        ],
      ),
    );
  }
}
