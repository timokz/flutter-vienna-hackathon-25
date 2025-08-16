import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';

String validateQuote(CreateQuoteRequest req) {
  final text = req.text.trim();
  if (text.isEmpty || text.length > 500) {
    throw FormatException('Text must be 1..500 chars');
  }
  if (req.lat.isNaN || req.lng.isNaN) {
    throw FormatException('Invalid coordinates');
  }
  if (req.lat < -90 || req.lat > 90 || req.lng < -180 || req.lng > 180) {
    throw FormatException('Coordinates out of bounds');
  }
  return text;
}

Future<List<Quote>> listNearby(
  Session session, {
  required double lat,
  required double lng,
  int radiusMeters = 1500,
  int limit = 50,
}) async {
  throw UnimplementedError();
}

enum Visibility { public, private, locallyPublic }
