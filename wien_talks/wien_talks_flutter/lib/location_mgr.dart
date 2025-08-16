import 'package:location/location.dart';

class LocationMgr {
  Location location = Location();

  bool serviceEnabled = false;

  PermissionStatus permissionGranted = PermissionStatus.denied;

  LocationData? locationData;

  static LocationMgr? _instance;

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
    return null;
  }
}
