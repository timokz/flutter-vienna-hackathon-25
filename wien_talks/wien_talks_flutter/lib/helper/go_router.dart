import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/screens/create_event_screen.dart';
import 'package:wien_talks_flutter/screens/news_screen.dart';

double? _qpDouble(GoRouterState s, String key) {
  final v = s.uri.queryParameters[key];
  return v == null || v.isEmpty ? null : double.tryParse(v);
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'news',
      builder: (c, s) => NewsScreen(),
    ),
    GoRoute(
      path: '/create_event',
      name: 'create_event',
      pageBuilder: (c, s) {
        final quote = s.extra as Quote?;
        final lat = _qpDouble(s, 'lat');
        final lon = _qpDouble(s, 'lon');

        return CustomTransitionPage(
          key: s.pageKey,
          child: CreateEventScreen(
            contextQuote: quote,
            initialLat: lat,
            initialLon: lon,
          ),
          transitionsBuilder: (context, anim, secAnim, child) {
            final curve =
                CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
            return FadeTransition(
              opacity: curve,
              child: SlideTransition(
                position: Tween(begin: const Offset(0, 0.08), end: Offset.zero)
                    .animate(curve),
                child: child,
              ),
            );
          },
        );
      },
    ),
  ],
);
