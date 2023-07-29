import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/shared/color_constants.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';
import 'package:barosv_contacts_app/shared/utils.dart';

class ContactsList extends StatefulWidget {
  final List<Contact> list;
  const ContactsList({
    super.key,
    required this.list,
  });

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  late AutoScrollController _scrollController;
  late Map<String, int> _mapIndex;

  @override
  void initState() {
    _mapIndex = Map.from(mapIndex);
    _scrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        0,
        0,
        MediaQuery.of(context).padding.bottom,
      ),
      axis: Axis.vertical,
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              final lastName = widget.list[index].lastName;

              if (lastName.isNotEmpty && mapIndex[lastName[0]] == -1) {
                mapIndex[lastName[0]] = index;
              }
              return AutoScrollTag(
                key: ValueKey(index),
                controller: _scrollController,
                index: index,
                child: ListTile(
                  visualDensity: const VisualDensity(
                    vertical: -3,
                  ),
                  onTap: () => context.go(
                    contactsViewPageId,
                    extra: widget.list[index],
                  ),
                  title: Row(
                    children: [
                      Text(
                        '${widget.list[index].firstName} ',
                      ),
                      Text(
                        widget.list[index].lastName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: secondaryColorDark,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: abcList
              .map(
                (letter) => InkWell(
                  onTap: () => _scrollToIndex(letter),
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Future _scrollToIndex(String letter) async {
    final index = _mapIndex[letter];
    if (index == -1) return;

    await _scrollController.scrollToIndex(
      index!,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
