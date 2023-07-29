import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class Segment extends StatelessWidget {
  final Widget content;
  final String hint;
  final String label;
  final VoidCallback onDelete;

  const Segment({
    super.key,
    required this.content,
    required this.hint,
    required this.label,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: secondaryColorDark,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Row(
        children: [
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
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  CupertinoIcons.minus_circle_fill,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
          Text(
            label,
            style: const TextStyle(color: Colors.blue),
          ),
          const SizedBox(width: 10.0),
          Icon(
            CupertinoIcons.forward,
            color: secondaryColor,
          ),
          const SizedBox(width: 10.0),
          Expanded(child: content),
        ],
      ),
    );
  }
}
