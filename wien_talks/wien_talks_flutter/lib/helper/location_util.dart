import 'package:flutter_dotenv/flutter_dotenv.dart';

String gStaticMap(
  double lat,
  double lon, {
  int w = 600,
  int h = 360,
  int zoom = 15,
  int scale = 2,
  String markerHex = 'E53935',
  String maptype = 'roadmap',
  String language = 'de',
  String region = 'AT',
}) {
  final mapsApiKey = dotenv.env['MAPS_KEY'] ?? '';
  final qp = <String, String>{
    'center': '$lat,$lon',
    'zoom': '$zoom',
    'size': '${w}x$h',
    'scale': '$scale',
    'maptype': maptype,
    'format': 'png',
    'language': language,
    'region': region,
    'markers': 'color:0x$markerHex|$lat,$lon',
    'key': mapsApiKey,
  };
  return Uri.https('maps.googleapis.com', '/maps/api/staticmap', qp).toString();
}
