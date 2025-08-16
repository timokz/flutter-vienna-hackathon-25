import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/screens/create_event_screen.dart';
import 'package:wien_talks_flutter/screens/login_page.dart';
import 'package:wien_talks_flutter/screens/news_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/', builder: (c, s) => NewsScreen()),
    GoRoute(
        path: '/create_event',
        name: 'create_event',
        builder: (c, s) => CreateEventScreen()),
  ],
);
