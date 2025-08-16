import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';

class QuoteDraft {
  final String text;
  final String? author;
  const QuoteDraft({required this.text, this.author});
}

typedef QuoteSubmit = FutureOr<void> Function(QuoteDraft draft);

/// If Simon reads this I'm sorry
class AddQuoteFab extends StatelessWidget {
  const AddQuoteFab({
    super.key,
    this.tooltip = 'Add quote',
    this.icon = Icons.format_quote_rounded,
    this.mini = false,
  });

  final String tooltip;
  final IconData icon;
  final bool mini;

  Future<void> onSubmit(QuoteDraft draft) async {
    final fix = await _getHackyLocation();
    if (fix == null || fix.latitude == null) {
      return;
    }

    await FunmapMgr().client.quote.createQuote(
          CreateQuoteRequest(
            text: draft.text,
            authorName: draft.author,
            lat: fix.latitude!,
            lng: fix.longitude!,
          ),
        );
  }

  Future<LocationData?> _getHackyLocation() async {
    final loc = Location();

    if (!await loc.serviceEnabled()) {
      if (!await loc.requestService()) return null;
    }

    var perm = await loc.hasPermission();
    if (perm == PermissionStatus.denied) {
      perm = await loc.requestPermission();
      if (perm != PermissionStatus.granted) return null;
    }

    return await loc.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: mini,
      tooltip: tooltip,
      onPressed: () async {
        final draft = await showQuoteEditor(context);
        if (draft != null) {
          await onSubmit(draft);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Quote saved')),
            );
          }
        }
      },
      child: Icon(icon),
    );
  }
}

Future<QuoteDraft?> showQuoteEditor(
  BuildContext context, {
  String? initialText,
  String? initialAuthor,
}) async {
  final textCtrl = TextEditingController(text: initialText ?? '');
  final authorCtrl = TextEditingController(text: initialAuthor ?? '');
  const maxChars = 500;

  return showModalBottomSheet<QuoteDraft>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (ctx) {
      bool canSave() {
        final t = textCtrl.text.trim();
        return t.isNotEmpty && t.length <= maxChars;
      }

      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (ctx, setSheetState) {
            void onChanged(_) => setSheetState(() {});
            final remaining = maxChars - textCtrl.text.characters.length;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('New quote', style: Theme.of(ctx).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  TextField(
                    controller: textCtrl,
                    onChanged: onChanged,
                    autofocus: true,
                    maxLines: null,
                    minLines: 3,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      labelText: 'Quote text',
                      hintText: 'How is Vienna surprising you today',
                      helperText: 'Max $maxChars characters',
                      counterText:
                          '${textCtrl.text.characters.length}/$maxChars',
                      border: const OutlineInputBorder(),
                    ),
                    maxLength: maxChars,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: authorCtrl,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Author (optional)',
                      hintText: 'e.g., Schmausi Wamperl',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(ctx).pop(null),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: canSave()
                              ? () => Navigator.of(ctx).pop(
                                    QuoteDraft(
                                      text: textCtrl.text.trim(),
                                      author: authorCtrl.text.trim().isEmpty
                                          ? null
                                          : authorCtrl.text.trim(),
                                    ),
                                  )
                              : null,
                          icon: const Icon(Icons.check),
                          label: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      remaining >= 0
                          ? '$remaining characters left'
                          : '${-remaining} over limit',
                      style: Theme.of(ctx).textTheme.labelSmall?.copyWith(
                            color: Theme.of(ctx)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.7),
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
