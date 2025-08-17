import 'dart:math' as math;

class LocationFilter {
  final double centerLat;
  final double centerLon;
  final double radiusMeters;
  const LocationFilter({
    required this.centerLat,
    required this.centerLon,
    required this.radiusMeters,
  });

  bool contains(double lat, double lon) =>
      _haversineMeters(centerLat, centerLon, lat, lon) <= radiusMeters;

  static double _haversineMeters(
      double lat1, double lon1, double lat2, double lon2) {
    const R = 6371000.0;
    final dLat = (lat2 - lat1) * (math.pi / 180.0);
    final dLon = (lon2 - lon1) * (math.pi / 180.0);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1 * (math.pi / 180.0)) *
            math.cos(lat2 * (math.pi / 180.0)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    return R * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }
}
