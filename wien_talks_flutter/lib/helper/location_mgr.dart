import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapsforge_flutter/core.dart';
import 'package:mapsforge_flutter/maps.dart';
import 'package:mapsforge_flutter/marker.dart';
import 'package:rxdart/rxdart.dart';

class LocationMgr {
  final Location location = Location();

  bool serviceEnabled = false;

  PermissionStatus permissionGranted = PermissionStatus.denied;

  LocationData? _lastLocationData;

  static LocationMgr? _instance;

  final Subject<LocationData> _subject = PublishSubject<LocationData>();

  final TileBitmapCache bitmapCache = MemoryTileBitmapCache.create();

  StreamSubscription? _subscription;

  ViewModel? viewModel;

  MapModel? mapModel;

  IconMarker? iconMarker;

  final DisplayModel displayModel = DisplayModel(maxZoomLevel: 18);

  final SymbolCache symbolCache = FileSymbolCache();

  final JobRenderer jobRenderer =
      kIsWeb ? MapOnlineRendererWeb() : MapOnlineRenderer();

  final MarkerByItemDataStore markerDataStore = MarkerByItemDataStore();

  factory LocationMgr() {
    _instance ??= LocationMgr._();
    return _instance!;
  }

  LocationMgr._();

  Future<String?> startup() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return "Service is not enabled";
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return "No permissions granted";
      }
    }
    mapModel = MapModel(
      displayModel: displayModel,
      renderer: jobRenderer,
      symbolCache: symbolCache,
      tileBitmapCache: bitmapCache,
    );
    mapModel?.markerDataStores.add(markerDataStore);
    viewModel = ViewModel(displayModel: displayModel);
    _subscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      _lastLocationData = currentLocation;
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        viewModel?.setMapViewPosition(
            currentLocation.latitude!, currentLocation.longitude!);
        if (iconMarker == null) {
          iconMarker ??= IconMarker(
              fontSize: 30,
              icon: Icons.gps_fixed,
              color: Colors.red,
              center: LatLong(
                  currentLocation.latitude!, currentLocation.longitude!),
              displayModel: displayModel);
          mapModel?.markerDataStores
              .add(MarkerDataStore()..addMarker(iconMarker!));
        }
      }
      _subject.add(currentLocation);
    });
    return null;
  }

  void shutdown() {
    _subscription?.cancel();
    _subscription = null;
    mapModel?.dispose();
    mapModel = null;
    iconMarker = null;
    viewModel?.dispose();
    viewModel = null;
    _lastLocationData = null;
  }

  Stream<LocationData> get stream => _subject.stream;

  LocationData? get lastLocation => _lastLocationData;
}
