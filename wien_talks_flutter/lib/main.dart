import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wien_talks_flutter/helper/go_router.dart';
import 'package:wien_talks_flutter/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wien Talks',
      theme: GemeindeBauTheme.light(),
      routerConfig: router,
    );
  }
}
