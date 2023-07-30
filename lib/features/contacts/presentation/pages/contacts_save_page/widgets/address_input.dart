import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barosv_contacts_app/shared/color_constants.dart';

class AddressInput extends StatefulWidget {
  final String hint;
  final String value;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;

  const AddressInput({
    super.key,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.textInputType = TextInputType.name,
  });

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  final _controller = TextEditingController();

  late String _value;

  @override
  void initState() {
    _controller.text = widget.value;
    _value = widget.value;
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
      autofocus: true,
      controller: _controller,
      onChanged: (value) {
        setState(() => _value = value);
        widget.onChanged(_value);
      },
      keyboardType: widget.textInputType,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffix: _value.isEmpty
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () {
                  _controller.clear();
                  setState(() => _value = '');
                  widget.onChanged(_value);
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
