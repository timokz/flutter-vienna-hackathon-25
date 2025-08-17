import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/widgets/card_contenty.dart';
import 'package:wien_talks_flutter/widgets/ubahn_tape.dart';

typedef StaticMapUrlBuilder = String Function(
  double lat,
  double lon, {
  int w,
  int h,
  int zoom,
});

class FlamboyantQuoteCard extends StatelessWidget {
  const FlamboyantQuoteCard({
    super.key,
    required this.quote,
    required this.meta,
    required this.onVoteUp,
    required this.onVoteDown,
    this.staticMapUrlBuilder,
    this.onTap,
  });

  final Quote quote;
  final String meta;
  final VoidCallback onVoteUp;
  final VoidCallback onVoteDown;
  final StaticMapUrlBuilder? staticMapUrlBuilder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final seed = (quote.id ?? quote.text.hashCode) & 0x7fffffff;
    final rng = math.Random(seed);

    final variant = rng.nextInt(3);
    final tiltDeg = [-2.2, -1.4, -0.6, 0, 0.6, 1.2, 2.0][rng.nextInt(7)];
    final tiltRad = tiltDeg * math.pi / 180.0;
    final accents = [
      const Color(0xFFE53935),
      const Color(0xFF3949AB),
      const Color(0xFF00897B),
    ];
    final accent = accents[seed % accents.length];

    final t = Theme.of(context);
    final metaStyle = t.textTheme.bodySmall?.copyWith(
      color: (t.textTheme.bodySmall?.color ?? t.colorScheme.onSurface)
          .withValues(alpha: 0.70),
    );

    final borderRadius = BorderRadius.circular(14);

    final cardContent = CardContenty(
      quote: quote,
      staticMapUrlBuilder: staticMapUrlBuilder,
      meta: meta,
      onVoteUp: onVoteUp,
      onVoteDown: onVoteDown,
      context: context,
      variant: variant,
      accent: accent,
      metaStyle: metaStyle,
    );

    final tappableCard = Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: t.colorScheme.surface,
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
          border: Border.all(color: accent.withValues(alpha: 0.25), width: 1),
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: cardContent,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Transform.rotate(
            angle: tiltRad,
            transformHitTests: false,
            child: tappableCard,
          ),
          Positioned(
            top: -8,
            right: 16,
            child: IgnorePointer(
              child: UbahnTape(
                lat: quote.lat,
                lon: quote.long,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
