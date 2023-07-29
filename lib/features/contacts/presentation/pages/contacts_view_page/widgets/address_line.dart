import 'package:flutter/material.dart';

class AddressLine extends StatelessWidget {
  final String label;
  final String value;

  const AddressLine({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const labelFlex = 6;
    const valueFlex = 9;
    return Row(
      children: [
        Expanded(
          flex: labelFlex,
          child: Text(
            '$label: ',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          flex: valueFlex,
          child: Text(
            value,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
