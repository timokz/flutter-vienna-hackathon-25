import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/widgets/flamboyant_quote_card.dart';

class MapPreview extends StatelessWidget {
  const MapPreview({
    super.key,
    required this.lat,
    required this.lon,
    required this.accent,
    this.staticMapUrlBuilder,
    this.aspect = 16 / 9,
  });

  final double lat;
  final double lon;
  final double aspect;
  final Color accent;
  final StaticMapUrlBuilder? staticMapUrlBuilder;

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: accent.withValues(alpha: 0.25), width: 1);
    final r = BorderRadius.circular(12);

    final urlBuilder = staticMapUrlBuilder;
    final w =
        (MediaQuery.of(context).size.width / 2).clamp(280.0, 600.0).toInt();
    final h = (w / aspect).round();

    Widget content;
    if (urlBuilder != null) {
      final url = urlBuilder(lat, lon, w: w, h: h, zoom: 15);

      content = ClipRRect(
        borderRadius: r,
        child: CachedNetworkImage(
          imageUrl: url,
          width: double.infinity,
          height: h.toDouble(),
          fit: BoxFit.cover,
        ),
      );
    } else {
      content =
          _MapPlaceholder(accent: accent, height: h.toDouble(), radius: r);
    }

    return DecoratedBox(
      decoration: BoxDecoration(border: border, borderRadius: r),
      child: content,
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder({required this.accent, this.height, this.radius});

  final Color accent;
  final double? height;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(12),
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              t.colorScheme.surfaceContainerHighest.withValues(alpha: 0.50),
              t.colorScheme.surfaceContainerHighest.withValues(alpha: 0.20),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: accent),
            const SizedBox(width: 8),
            Text('Map preview', style: t.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
