import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/widgets/quote_card.dart';

class ShowLatestNewsWidget extends StatefulWidget {
  const ShowLatestNewsWidget({super.key});

  @override
  State<ShowLatestNewsWidget> createState() => _ShowLatestNewsWidgetState();
}

class _ShowLatestNewsWidgetState extends State<ShowLatestNewsWidget> {
  List<Quote>? _quotes;
  Object? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final list = await FunmapMgr().client.quote.getAllQuotes();
      final quotes = list.whereType<Quote>().toList(growable: false);
      quotes.sort((a, b) => (b.createdAt).compareTo(a.createdAt));
      setState(() {
        _quotes = quotes;
      });
    } catch (e) {
      setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _refresh() => _fetch();

  Future<void> _vote(Quote quote, bool up) async {
    if (_quotes == null) return;
    final idx = _quotes!.indexWhere((q) => q.id == quote.id);
    if (idx < 0) return;

    final original = _quotes![idx];
    final updated = original.copyWith(
      upvotes: up ? original.upvotes + 1 : original.upvotes,
      downvotes: up ? original.downvotes : original.downvotes + 1,
    );

    setState(() {
      final copy = List<Quote>.from(_quotes!);
      copy[idx] = updated;
      _quotes = copy;
    });

    try {
      await FunmapMgr().client.quote.updateQuote(updated);
    } catch (e) {
      setState(() {
        final copy = List<Quote>.from(_quotes!);
        copy[idx] = original;
        _quotes = copy;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vote failed: $e')),
      );
    }
  }

  String _timeAgo(DateTime? dt) {
    final d = (dt ?? DateTime.fromMillisecondsSinceEpoch(0)).toLocal();
    final diff = DateTime.now().difference(d);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Error: $_error'),
        ),
      );
    }
    final quotes = _quotes ?? const <Quote>[];
    if (quotes.isEmpty) {
      return const Center(child: Text('No quotes yet.'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final unboundedHeight = constraints.maxHeight == double.infinity;

        final list = ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          shrinkWrap: unboundedHeight,
          physics: unboundedHeight
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          itemCount: quotes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, i) {
            final q = quotes[i];
            final author = (q.authorName ?? '').trim();
            final meta = [
              if (author.isNotEmpty) author,
              _timeAgo(q.createdAt),
            ].join(' · ');

            return QuoteCard(
              quote: q,
              meta: meta,
              onVoteUp: () => _vote(q, true),
              onVoteDown: () => _vote(q, false),
            );
          },
        );

        if (unboundedHeight) return list;
        return RefreshIndicator(onRefresh: _refresh, child: list);
      },
    );
  }
}
