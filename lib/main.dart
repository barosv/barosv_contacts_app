import 'package:flutter/material.dart';

import 'app.dart';
import 'injections/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const ContactsApp());
}
