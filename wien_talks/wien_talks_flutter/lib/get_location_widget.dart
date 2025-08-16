import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wien_talks_flutter/location_mgr.dart';

class GetLocationWidget extends StatelessWidget {
  const GetLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: LocationMgr().startup(),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  {
                    if (snapshot.hasData) {
                      // Error occured
                      return Text(snapshot.data.toString());
                    } else {
                      return Text("No data -> OK");
                    }
                  }
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return Text("OK");
              }
            }),
        StreamBuilder(stream: LocationMgr().stream, builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) => Text(snapshot.data.toString())),
      ],
    );
  }
}
