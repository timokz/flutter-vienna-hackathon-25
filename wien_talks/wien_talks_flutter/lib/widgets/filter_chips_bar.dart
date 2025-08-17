import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';

class FilterChipsBar extends StatelessWidget {
  const FilterChipsBar({
    super.key,
    required this.sort,
    required this.today,
    required this.nearby,
    required this.onSortChanged,
    required this.onTodayChanged,
    required this.onNearbyPressed,
    this.onClear,
  });

  final String sort;
  final bool today;
  final bool nearby;

  final ValueChanged<String> onSortChanged;
  final ValueChanged<bool> onTodayChanged;
  final VoidCallback onNearbyPressed;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 40),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: [
          ChoiceChip(
            label: const Text('New'),
            selected: sort == 'new',
            onSelected: (_) => onSortChanged('new'),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Loved'),
            selected: sort == 'top',
            onSelected: (_) => onSortChanged('top'),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Today'),
            selected: today,
            onSelected: (v) => onTodayChanged(v),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: Text('Close by'),
            selected: nearby,
            onSelected: (_) => onNearbyPressed(),
          ),
          if (onClear != null && (today || nearby)) ...[
            const SizedBox(width: 8),
            ActionChip(
              label: const Text('Clear'),
              onPressed: onClear,
            ),
          ],
        ],
      ),
    );
  }
}
