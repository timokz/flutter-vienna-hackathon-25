import 'package:flutter/foundation.dart';

import 'location_filter.dart';

class FilterController extends ValueNotifier<LocationFilter?> {
  FilterController([super.initial]);
  void clear() => value = null;
  void setLocation(double lat, double lon, double radiusMeters) {
    value = LocationFilter(
        centerLat: lat, centerLon: lon, radiusMeters: radiusMeters);
  }
}
