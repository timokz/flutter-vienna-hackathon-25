import 'dart:math' as math;

import 'package:flutter/material.dart';

class UbahnTape extends StatelessWidget {
  const UbahnTape({
    super.key,
    this.lat,
    this.lon,
    this.rotationDeg = 6,
    this.maxLinesShown = 1,
    this.stations = kViennaStationsSample,
  });

  final double? lat;
  final double? lon;
  final double rotationDeg;
  final int maxLinesShown;
  final List<UbahnStation> stations;

  @override
  Widget build(BuildContext context) {
    final lines = _resolveLines();
    final primary = lines.isNotEmpty
        ? (kUbahnLineColors[lines.first] ?? _kNeutral)
        : _kNeutral;

    final bg = primary.withValues(alpha: 0.30);

    return Transform.rotate(
      angle: rotationDeg * math.pi / 180,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: primary.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 14,
              height: 14,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _uBlue,
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Text(
                'U',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 6),
            if (lines.isNotEmpty)
              ...lines.take(maxLinesShown).expand((line) => [
                    _LineChip(line: line),
                    const SizedBox(width: 4),
                  ]),
          ],
        ),
      ),
    );
  }

  List<String> _resolveLines() {
    if (lat == null || lon == null) return const [];
    final nearest = _nearestStation(stations, lat!, lon!);
    return nearest?.lines ?? const [];
  }
}

class _LineChip extends StatelessWidget {
  const _LineChip({required this.line});
  final String line;

  @override
  Widget build(BuildContext context) {
    final color = kUbahnLineColors[line] ?? _kNeutral;
    final on = _onColor(color);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        line,
        style: TextStyle(
          color: on,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          height: 1.0,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

Color _onColor(Color bg) {
  return ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
      ? Colors.white
      : const Color(0xFF111111);
}

const _uBlue = Color(0xFF1E88E5); // Vienna U sign-ish blue
const _kNeutral = Color(0xFF9E9E9E);

// Official-ish line colors
const Map<String, Color> kUbahnLineColors = {
  'U1': Color(0xFFE20613), // red
  'U2': Color(0xFFA762A3), // purple
  'U3': Color(0xFFF29400), // orange
  'U4': Color(0xFF009640), // green
  'U5': Color(0xFF63318F), // violet (future)
  'U6': Color(0xFF8D5B2D), // brown
};

class UbahnStation {
  const UbahnStation(this.name, this.lat, this.lon, this.lines);
  final String name;
  final double lat;
  final double lon;
  final List<String> lines; // e.g., ['U1','U3']
}

UbahnStation? _nearestStation(
  List<UbahnStation> stations,
  double lat,
  double lon,
) {
  if (stations.isEmpty) return null;
  UbahnStation best = stations.first;
  double bestD = _haversine(best.lat, best.lon, lat, lon);
  for (var i = 1; i < stations.length; i++) {
    final s = stations[i];
    final d = _haversine(s.lat, s.lon, lat, lon);
    if (d < bestD) {
      best = s;
      bestD = d;
    }
  }
  return best;
}

double _haversine(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371000.0;
  final dLat = (lat2 - lat1) * (math.pi / 180.0);
  final dLon = (lon2 - lon1) * (math.pi / 180.0);
  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1 * (math.pi / 180.0)) *
          math.cos(lat2 * (math.pi / 180.0)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return R * c;
}

// Compact central sample; swap in full dataset when ready
const List<UbahnStation> kViennaStationsSample = [
  UbahnStation('Stephansplatz', 48.2084, 16.3731, ['U1', 'U3']),
  UbahnStation('Karlsplatz', 48.2000, 16.3690, ['U1', 'U2', 'U4']),
  UbahnStation('Schwedenplatz', 48.2111, 16.3776, ['U1', 'U4']),
  UbahnStation('Praterstern', 48.2169, 16.3909, ['U1', 'U2']),
  UbahnStation('Schottenring', 48.2152, 16.3720, ['U2', 'U4']),
  UbahnStation('Volkstheater', 48.2078, 16.3604, ['U2', 'U3']),
  UbahnStation('Museumsquartier', 48.2026, 16.3614, ['U2']),
  UbahnStation('Westbahnhof', 48.1967, 16.3378, ['U3', 'U6']),
  UbahnStation('Wien Mitte/Landstraße', 48.2070, 16.3834, ['U3', 'U4']),
  UbahnStation('Spittelau', 48.2409, 16.3585, ['U4', 'U6']),
  UbahnStation('Längenfeldgasse', 48.1848, 16.3299, ['U4', 'U6']),
  UbahnStation('Erdberg', 48.1907, 16.4196, ['U3']),
  UbahnStation('Kaisermühlen VIC', 48.2348, 16.4130, ['U1']),
  UbahnStation('Floridsdorf', 48.2570, 16.4030, ['U6']),
  UbahnStation('Ottakring', 48.2120, 16.3080, ['U3']),
];
