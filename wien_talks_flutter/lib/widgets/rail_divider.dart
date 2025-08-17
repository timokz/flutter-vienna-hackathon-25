import 'package:flutter/material.dart';

class RailDivider extends StatelessWidget {
  const RailDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).dividerColor.withValues(alpha: 0.40);
    return Container(
      height: 18,
      width: 1,
      margin: const EdgeInsets.only(bottom: 6),
      color: c,
      alignment: Alignment.topRight,
    );
  }
}
