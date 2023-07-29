import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_bloc.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contacts_state.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(const GetAll());
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (_, state) {
            if (state is ContactsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.white),
              );
            }

            if (state is ContactsDone) {
              return ListView.builder(
                itemCount: state.contacts!.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      state.contacts![index].firstName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
