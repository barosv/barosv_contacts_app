import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contacts_state.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';

import 'widgets/index.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
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

                  // SEARCH WITH NO RESULTS
                  if (state.contacts!.isEmpty && _search.isNotEmpty)
                    NoSearchResults(_search),

                  if (state.contacts!.isEmpty && _search.isEmpty)
                    const NoResults(),

                  if (state.contacts!.isNotEmpty)
                    Expanded(
                      child: ContactsList(list: state.contacts!),
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
}
