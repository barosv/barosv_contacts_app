import 'package:flutter/material.dart' show FocusManager;

void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
