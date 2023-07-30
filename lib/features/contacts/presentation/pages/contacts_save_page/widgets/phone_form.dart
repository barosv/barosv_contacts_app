import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class PhoneForm extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const PhoneForm({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _controller = TextEditingController();

  String _value = '';

  @override
  void initState() {
    _controller.text = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        setState(() => _value = value);
        widget.onChanged(value);
      },
      autofocus: true,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: AppLocalizations.of(context)!.phoneNumber,
        suffix: _value.isEmpty
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () {
                  _controller.clear();
                  setState(() => _value = '');
                  widget.onChanged('');
                },
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: secondaryColor,
                  size: 17.0,
                ),
              ),
      ),
    );
  }
}
