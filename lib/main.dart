import 'package:flutter/material.dart';

import 'app.dart';
import 'injections/injection.dart';

void main() {
  configureDependencies();
  runApp(const ContactsApp());
}
