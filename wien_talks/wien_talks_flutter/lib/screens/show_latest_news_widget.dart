import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/helper/location_util.dart';
import 'package:wien_talks_flutter/helper/time_util.dart';
import 'package:wien_talks_flutter/widgets/flamboyant_quote_card.dart';

class LatestQuotesScreen extends StatefulWidget {
  const LatestQuotesScreen({super.key});

  @override
  State<LatestQuotesScreen> createState() => _LatestQuotesScreenState();
}

class _LatestQuotesScreenState extends State<LatestQuotesScreen> {
  final List<Quote> _quotes = [];
  StreamSubscription<Quote>? _sub;

  Object? _error;

  @override
  void initState() {
    super.initState();
    _connectStream();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void _connectStream() {
    _sub?.cancel();
    _sub = FunmapMgr().client.quote.streamAllQuotes(limit: 50).listen(
          (q) => setState(() => _upsert(q)),
          onError: (e) => setState(() => _error = e),
          onDone: () => Future.delayed(const Duration(seconds: 2), () {
            if (mounted) _connectStream();
          }),
          cancelOnError: false,
        );
  }

  void _upsert(Quote q) {
    final i = _quotes.indexWhere((x) => x.id == q.id);
    if (i >= 0) {
      _quotes[i] = q;
    } else {
      _quotes.add(q);
    }
    _quotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void _sortDesc() {
    _quotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> _vote(Quote quote, bool up) async {
    final idx = _quotes.indexWhere((q) => q.id == quote.id);
    if (idx < 0) return;

    final original = _quotes[idx];
    final updated = original.copyWith(
      upvotes: up ? original.upvotes + 1 : original.upvotes,
      downvotes: up ? original.downvotes : original.downvotes + 1,
    );

    setState(() {
      _quotes[idx] = updated;
      _sortDesc();
    });

    try {
      await FunmapMgr().client.quote.updateQuote(updated);
    } catch (e) {
      if (!mounted) return;
      setState(() => _quotes[idx] = original);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vote failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quotes.isEmpty && _error == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null && _quotes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Error: $_error'),
        ),
      );
    }
    if (_quotes.isEmpty) {
      return const Center(child: Text('Nix da. Sag halt was'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
          itemCount: _quotes.length,
          itemBuilder: (context, i) {
            final q = _quotes[i];
            final author = (q.authorName ?? '').trim();
            final meta = [
              if (author.isNotEmpty) author,
              timeAgo(q.createdAt),
            ].join(' · ');

            return FlamboyantQuoteCard(
                quote: q,
                meta: meta,
                onVoteUp: () => _vote(q, true),
                onVoteDown: () => _vote(q, false),
                staticMapUrlBuilder: gStaticMap);
          },
        );
      },
    );
  }
}
