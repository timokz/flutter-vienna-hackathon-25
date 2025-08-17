import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/widgets/vote_button.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({
    super.key,
    required this.quote,
    required this.meta,
    required this.onVoteUp,
    required this.onVoteDown,
  });

  final Quote quote;
  final String meta;
  final VoidCallback onVoteUp;
  final VoidCallback onVoteDown;

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  static const int _collapsedMaxLines = 4;
  static const int _lengthHintForMore = 160;

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final baseSmall = t.textTheme.bodySmall;
    final baseSmallColor = baseSmall?.color;
    final metaColor = baseSmallColor?.withValues(alpha: 0.70);

    final showMoreToggle = widget.quote.text.length > _lengthHintForMore;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.quote.text,
                    style: t.textTheme.bodyLarge,
                    softWrap: true,
                    maxLines: _expanded ? null : _collapsedMaxLines,
                    overflow: _expanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.meta,
                          style: baseSmall?.copyWith(color: metaColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (showMoreToggle) ...[
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () =>
                              setState(() => _expanded = !_expanded),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(_expanded ? 'Less' : 'More'),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 56),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // RailDivider(),
                  const SizedBox(height: 4),
                  //todo(timo) michi hauepl icon
                  VoteButton(
                    icon: Icons.arrow_upward,
                    semantics: 'Upvote',
                    count: widget.quote.upvotes,
                    onPressed: widget.onVoteUp,
                    color: t.colorScheme.primary,
                  ),
                  const SizedBox(height: 4),
                  VoteButton(
                    icon: Icons.arrow_downward,
                    semantics: 'Downvote',
                    count: widget.quote.downvotes,
                    onPressed: widget.onVoteDown,
                    color: t.colorScheme.error,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
