import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/helper/go_router.dart';

void main() {
  FunmapMgr();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wien Talks FunMap',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}
