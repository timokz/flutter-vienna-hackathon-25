import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({
    super.key,
    required this.icon,
    required this.semantics,
    required this.count,
    required this.onPressed,
    required this.color,
  });

  final IconData icon;
  final String semantics;
  final int count;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          tooltip: semantics,
          color: color,
          iconSize: 20,
          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
          padding: EdgeInsets.zero,
          splashRadius: 20,
          visualDensity: VisualDensity.compact,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: Text(
            '$count',
            key: ValueKey(count),
            style: t.textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
