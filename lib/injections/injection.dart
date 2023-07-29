import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/data/models/repositories/contacts_repository.dart';
import 'package:barosv_contacts_app/features/contacts/domain/contacts_controller.dart';
import 'package:barosv_contacts_app/objectbox.g.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Initialize Objectbox
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final objectboxDirectory = join(appDocumentDir.path, 'contactsDB');
  final store = await openStore(directory: objectboxDirectory);
  getIt.registerSingleton(store);

  // Register Box
  getIt.registerLazySingleton<Box<Contact>>(
    () => Box<Contact>(store),
  );

  // Register Repositories
  getIt.registerLazySingleton<ContactsRepository>(
    () => ContactsRepository(getIt<Box<Contact>>()),
  );

  // Register Controllers
  getIt.registerLazySingleton<ContactsController>(() => ContactsController());

  // Register SharedPreferences
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}
