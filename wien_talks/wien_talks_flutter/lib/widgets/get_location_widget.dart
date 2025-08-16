import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/helper/location_mgr.dart';

class GetLocationWidget extends StatefulWidget {
  final Widget child;

  const GetLocationWidget({super.key, required this.child});

  @override
  State<GetLocationWidget> createState() => _GetLocationWidgetState();
}

class _GetLocationWidgetState extends State<GetLocationWidget> {
  @override
  void dispose() {
    LocationMgr().shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocationMgr().startup(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              {
                if (snapshot.hasData) {
                  // Error occured
                  return Text(snapshot.data.toString(),
                      style: TextStyle(color: Colors.red));
                } else {
                  return widget.child;
                }
              }
          }
        });
  }
}
