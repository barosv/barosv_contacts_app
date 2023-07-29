import 'package:flutter/material.dart';

class LogoAndName extends StatelessWidget {
  final String letters;
  final String name;

  const LogoAndName({
    super.key,
    required this.letters,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          radius: 40.0,
          child: Text(
            letters,
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
