import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:barosv_contacts_app/shared/utils.dart';

class SearchInput extends StatefulWidget {
  final VoidCallback onCancel;
  final ValueChanged<String> onChanged;

  const SearchInput({
    super.key,
    required this.onCancel,
    required this.onChanged,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();
  bool _showCancelButton = false;

  @override
  void initState() {
    _controller.addListener(() {
      widget.onChanged(_controller.text);

      if (!_showCancelButton) {
        setState(() => _showCancelButton = true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: const Icon(CupertinoIcons.search),
              ),
            ),
          ),
          if (_showCancelButton) ...[
            const SizedBox(width: 10.0),
            InkWell(
              onTap: () {
                widget.onCancel();
                setState(() {
                  _controller.text = '';
                  _showCancelButton = false;
                });
                hideKeyboard();
              },
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
