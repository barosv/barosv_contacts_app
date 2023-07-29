import 'package:go_router/go_router.dart';

import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_save_page/contacts_save_page.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_search_page/contacts_search_page.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_list_page/contacts_list_page.dart';
import 'package:barosv_contacts_app/features/contacts/presentation/pages/contacts_view_page/contacts_view_page.dart';
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
      builder: (context, state) => const ContactsSavePage(),
    ),
    GoRoute(
      path: contactsSearchPageId,
      builder: (context, state) => const ContactsSearchPage(),
    ),
    GoRoute(
      path: contactsViewPageId,
      builder: (context, state) => const ContactsViewPage(),
    ),
  ],
);
