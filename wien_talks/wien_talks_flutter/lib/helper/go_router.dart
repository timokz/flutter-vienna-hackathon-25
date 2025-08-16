import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/create_event_screen.dart';
import 'package:wien_talks_flutter/helper/auth_service.dart';
import 'package:wien_talks_flutter/login_page.dart';
import 'package:wien_talks_flutter/news_screen.dart';

final router = GoRouter(
  redirect: (context, state) {
    final loggedIn = AuthService.user != null;
    final atLogin = state.matchedLocation == '/login';
    if (!loggedIn && !atLogin) return '/login';
    if (loggedIn && atLogin) return '/';
    return null;
  },
  refreshListenable: AuthChangeNotifier(),
  routes: [
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/', builder: (c, s) => NewsScreen()),
    GoRoute(
        path: '/create_event',
        name: 'create_event',
        builder: (c, s) => CreateEventScreen()),
  ],
);

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier() {
    AuthService.onUserChanged.listen((_) => notifyListeners());
  }
}
