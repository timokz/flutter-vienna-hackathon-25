import 'dart:async';

import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationMgr {
  Location location = Location();

  bool serviceEnabled = false;

  PermissionStatus permissionGranted = PermissionStatus.denied;

  LocationData? _lastLocationData;

  static LocationMgr? _instance;

  final Subject<LocationData> _subject = PublishSubject<LocationData>();

  StreamSubscription? _subscription;

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
    _subscription = location.onLocationChanged.listen((LocationData currentLocation) {
      _lastLocationData = currentLocation;
      _subject.add(currentLocation);
    });
    return null;
  }

  void shutdown() {
    _subscription?.cancel();
    _subscription = null;
  }

  Stream<LocationData> get stream => _subject.stream;

  LocationData? get lastLocation => _lastLocationData;
}
