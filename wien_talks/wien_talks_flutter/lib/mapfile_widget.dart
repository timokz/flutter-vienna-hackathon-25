import 'package:flutter/cupertino.dart';
import 'package:mapsforge_flutter/core.dart';
import 'package:wien_talks_flutter/location_mgr.dart';

class MapfileWidget extends StatefulWidget {
  const MapfileWidget({super.key});

  @override
  State<MapfileWidget> createState() => _MapfileWidgetState();
}

//////////////////////////////////////////////////////////////////////////////

class _MapfileWidgetState extends State<MapfileWidget> {
  @override
  Widget build(BuildContext context) {
    return MapviewWidget(
        displayModel: LocationMgr().displayModel,
        createMapModel: () async {
          return LocationMgr().mapModel!;
        },
        createViewModel: () async {
          return LocationMgr().viewModel!;
        });
  }
}
