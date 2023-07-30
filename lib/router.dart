import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/data/models/contact.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/index.dart';
import 'package:barosv_contacts_app/features/splash/splash_screen.dart';
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
    GoRoute(
      path: contactsSavePageId,
      builder: (context, state) => ContactsSavePage(
        contact: state.extra as Contact?,
      ),
    ),
    GoRoute(
      path: contactsViewPageId,
      builder: (context, state) => ContactsViewPage(
        contact: state.extra as Contact?,
      ),
    ),
  ],
);
