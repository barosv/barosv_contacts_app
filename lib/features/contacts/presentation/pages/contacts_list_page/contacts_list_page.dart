import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_list_page/widgets/no_results.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_list_page/widgets/search_input.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contacts_state.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final abcList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '#',
  ];

  final mapIndex = {
    'A': -1,
    'B': -1,
    'C': -1,
    'D': -1,
    'E': -1,
    'F': -1,
    'G': -1,
    'H': -1,
    'I': -1,
    'J': -1,
    'K': -1,
    'L': -1,
    'M': -1,
    'N': -1,
    'O': -1,
    'P': -1,
    'Q': -1,
    'R': -1,
    'S': -1,
    'T': -1,
    'U': -1,
    'V': -1,
    'W': -1,
    'X': -1,
    'Y': -1,
    'Z': -1,
  };

  late AutoScrollController _scrollController;

  String _search = '';

  @override
  void initState() {
    _scrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
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
    context.read<ContactsBloc>().add(const GetAll());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.contacts),
          actions: [
            InkWell(
              onTap: () => context.push(contactsSavePageId),
              child: const Icon(CupertinoIcons.add),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (_, state) {
            if (state is ContactsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.white),
              );
            }

            if (state is ContactsDone) {
              return Column(
                children: [
                  SearchInput(
                    onCancel: () {
                      _search = '';
                      context.read<ContactsBloc>().add(const GetAll());
                    },
                    onChanged: (value) {
                      _search = value;
                      context.read<ContactsBloc>().add(Search(search: value));
                    },
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: state.contacts!.isEmpty
                              ? NoResults(_search)
                              : ListView.separated(
                                  controller: _scrollController,
                                  itemCount: state.contacts!.length,
                                  itemBuilder: (_, index) {
                                    final lastName =
                                        state.contacts![index].lastName;

                                    if (mapIndex[lastName[0]] == -1) {
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
                                        onTap: () =>
                                            context.push(contactsViewPageId),
                                        title: Row(
                                          children: [
                                            Text(
                                              '${state.contacts![index].firstName} ',
                                            ),
                                            Text(
                                              state.contacts![index].lastName,
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
                                    color: Colors.grey.shade900,
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
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future _scrollToIndex(String letter) async {
    final index = mapIndex[letter];
    if (index == -1) return;

    await _scrollController.scrollToIndex(
      index!,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
