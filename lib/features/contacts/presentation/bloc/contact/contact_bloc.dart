import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barosv_contacts_app/features/contacts/domain/contacts_controller.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contact_event.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/bloc/contact/contacts_state.dart';
import 'package:barosv_contacts_app/injections/injection.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(const ContactsLoading()) {
    on<Initial>(onInitial);
    on<Search>(onSearch);
    on<GetAll>(onGetAll);
    on<Get>(onGet);
    on<Create>(onCreate);
    on<CreateAll>(onCreateAll);
    on<Update>(onUpdate);
    on<Delete>(onDelete);
    on<DeleteAll>(onDeleteAll);
  }

  void onInitial(Initial event, Emitter<ContactsState> emit) {
    emit(const ContactsDone([]));
  }

  void onSearch(Search event, Emitter<ContactsState> emit) {
    final contacts = getIt.get<ContactsController>().search(
          search: event.search,
        );
    emit(ContactsDone(contacts));
  }

  void onGetAll(GetAll event, Emitter<ContactsState> emit) {
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }

  void onGet(Get event, Emitter<ContactsState> emit) {
    final contact = getIt.get<ContactsController>().get(event.id);
    emit(ContactDone(contact));
  }

  void onCreate(Create event, Emitter<ContactsState> emit) {
    getIt.get<ContactsController>().create(event.contact);
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }

  void onCreateAll(CreateAll event, Emitter<ContactsState> emit) {
    getIt.get<ContactsController>().createAll(event.contacts);
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }

  void onUpdate(Update event, Emitter<ContactsState> emit) {
    getIt.get<ContactsController>().update(event.contact);
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }

  void onDelete(Delete event, Emitter<ContactsState> emit) {
    getIt.get<ContactsController>().delete(event.id);
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }

  void onDeleteAll(DeleteAll event, Emitter<ContactsState> emit) {
    getIt.get<ContactsController>().deleteAll();
    final contacts = getIt.get<ContactsController>().getAll();
    emit(ContactsDone(contacts));
  }
}
