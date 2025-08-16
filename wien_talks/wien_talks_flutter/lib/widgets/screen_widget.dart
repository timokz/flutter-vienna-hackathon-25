import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;

  const ScreenWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
//      floatingActionButton: AddQuoteFab(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoaderOverlay(child: child),
      )),
    );
  }
}
