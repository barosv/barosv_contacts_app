import 'package:barosv_contacts_app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_list_page/contacts_list_page.dart';
import 'package:barosv_contacts_app/shared/pages_ids.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: contactsListPageId,
      builder: (context, state) => const ContactsListPage(),
    ),
  ],
);
