import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/create_event_screen.dart';
import 'package:wien_talks_flutter/news_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => NewsScreen(),
    ),
    GoRoute(path: '/create_event', name: 'create_event', builder: (context, state) => CreateEventScreen()),
  ],
);
