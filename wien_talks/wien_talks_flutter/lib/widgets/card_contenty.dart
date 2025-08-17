import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/widgets/flamboyant_quote_card.dart';
import 'package:wien_talks_flutter/widgets/map_preview_widget.dart';

class CardContenty extends StatelessWidget {
  const CardContenty({
    super.key,
    required this.quote,
    required this.staticMapUrlBuilder,
    required this.meta,
    required this.onVoteUp,
    required this.onVoteDown,
    required this.context,
    required this.variant,
    required this.accent,
    required this.metaStyle,
  });

  final Quote quote;
  final StaticMapUrlBuilder? staticMapUrlBuilder;
  final String meta;
  final VoidCallback onVoteUp;
  final VoidCallback onVoteDown;
  final BuildContext context;
  final int variant;
  final Color accent;
  final TextStyle? metaStyle;

  @override
  Widget build(BuildContext context) {
    final hasMap = (variant != 0);
    final map = hasMap
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MapPreview(
              lat: quote.lat,
              lon: quote.long,
              accent: accent,
              staticMapUrlBuilder: staticMapUrlBuilder,
            ),
          )
        : const SizedBox.shrink();

    final textBlock = _ContentText(
        quote: quote,
        meta: meta,
        metaStyle: metaStyle,
        onVoteUp: onVoteUp,
        onVoteDown: onVoteDown,
        accent: accent);

    stacked() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [map, textBlock],
        );

    return switch (variant) {
      1 when hasMap => stacked(),
      2 when hasMap => LayoutBuilder(
          builder: (context, c) {
            final wide = c.maxWidth >= 420;
            return wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 8, 12),
                          child: MapPreview(
                            lat: quote.lat,
                            lon: quote.long,
                            accent: accent,
                            staticMapUrlBuilder: staticMapUrlBuilder,
                            aspect: 4 / 3,
                          ),
                        ),
                      ),
                      Flexible(flex: 7, child: textBlock),
                    ],
                  )
                : stacked();
          },
        ),
      _ => textBlock,
    };
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({
    required this.quote,
    required this.meta,
    required this.metaStyle,
    required this.onVoteUp,
    required this.onVoteDown,
    required this.accent,
  });

  final Quote quote;
  final String meta;
  final TextStyle? metaStyle;
  final VoidCallback onVoteUp;
  final VoidCallback onVoteDown;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: Text(meta,
                      style: metaStyle, overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 8),
              _VotePills(
                up: quote.upvotes,
                down: quote.downvotes,
                onUp: onVoteUp,
                onDown: onVoteDown,
                accent: accent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VotePills extends StatelessWidget {
  const _VotePills({
    required this.up,
    required this.down,
    required this.onUp,
    required this.onDown,
    required this.accent,
  });

  final int up;
  final int down;
  final VoidCallback onUp;
  final VoidCallback onDown;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final bg = t.colorScheme.surfaceContainerHighest.withValues(alpha: 0.55);
    final onBg = ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
        ? Colors.white
        : const Color(0xFF1A1A1A);
    final pillStyle = t.textTheme.labelSmall?.copyWith(color: onBg);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Pill(
          icon: Icons.arrow_upward,
          color: accent,
          text: '$up',
          onTap: onUp,
          textStyle: pillStyle,
        ),
        const SizedBox(width: 6),
        _Pill(
          icon: Icons.arrow_downward,
          color: const Color(0xFFD32F2F),
          text: '$down',
          onTap: onDown,
          textStyle: pillStyle,
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
    required this.textStyle,
  });

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(text, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
