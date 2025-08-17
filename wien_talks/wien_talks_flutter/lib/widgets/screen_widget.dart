import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:wien_talks_flutter/widgets/add_quote_fab.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;

  const ScreenWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddQuoteFab(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoaderOverlay(
            overlayWidgetBuilder: (_) {
              switch (Random().nextInt(5)) {
                case 0:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case 1:
                  return Center(
                    child: SpinKitCubeGrid(
                        size: 50, color: Theme.of(context).primaryColor),
                  );
                case 2:
                  return Center(
                    child: SpinKitWave(color: Theme.of(context).primaryColor),
                  );
                case 3:
                  return Center(
                    child:
                        SpinKitHourGlass(color: Theme.of(context).primaryColor),
                  );
                case 4:
                  return Center(
                    child: SpinKitFadingCircle(
                        color: Theme.of(context).primaryColor),
                  );
                default:
                  return Center(
                    child: SpinKitPulsingGrid(
                        color: Theme.of(context).primaryColor),
                  );
              }
            },
            child: child),
      )),
    );
  }
}
