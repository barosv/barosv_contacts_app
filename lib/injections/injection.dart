import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/repositories/contacts_repository.dart';
import 'package:barosv_contacts_app/objectbox.g.dart';
import 'package:barosv_contacts_app/injections/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() async {
  getIt.init();

  // Initialize Objectbox
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final objectboxDirectory = join(appDocumentDir.path, 'contactsDB');
  getIt.registerSingleton(await openStore(directory: objectboxDirectory));

  // Register Repositories
  getIt.registerLazySingleton<ContactsRepository>(
    () => ContactsRepository(getIt<Box<Contact>>()),
  );
}
