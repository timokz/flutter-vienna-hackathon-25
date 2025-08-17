import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/helper/location_filter.dart';
import 'package:wien_talks_flutter/helper/location_util.dart';
import 'package:wien_talks_flutter/helper/time_util.dart';
import 'package:wien_talks_flutter/widgets/filter_chips_bar.dart';
import 'package:wien_talks_flutter/widgets/filter_overlay.dart';
import 'package:wien_talks_flutter/widgets/flamboyant_quote_card.dart';

class LatestQuotesScreen extends StatefulWidget {
  const LatestQuotesScreen({super.key});

  @override
  State<LatestQuotesScreen> createState() => _LatestQuotesScreenState();
}

class _LatestQuotesScreenState extends State<LatestQuotesScreen> {
  final List<Quote> _quotes = [];
  StreamSubscription<Quote>? _sub;
  LocationFilter? _locationFilter;
  String _sort = 'new';
  bool _today = false;
  bool _nearby = false;
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
    _applyFilters();
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

  List<Quote> get _view {
    final now = DateTime.now();

    bool isToday(DateTime t) {
      final lt = t.toLocal();
      final ln = now.toLocal();
      return lt.year == ln.year && lt.month == ln.month && lt.day == ln.day;
    }

    Iterable<Quote> it = _quotes;

    if (_today) {
      it = it.where((q) => isToday(q.createdAt));
    }
    if (_nearby && _locationFilter != null) {
      final f = _locationFilter!;
      it = it.where((q) => f.contains(q.lat, q.long));
    }

    final list = it.toList()
      ..sort((a, b) {
        if (_sort == 'top') {
          final as = (a.upvotes - a.downvotes);
          final bs = (b.upvotes - b.downvotes);
          final cmp = bs.compareTo(as);
          if (cmp != 0) return cmp;
        }
        return b.createdAt.compareTo(a.createdAt);
      });

    return list;
  }

  Future<void> _pickLocationFilter() async {
    final picked = await showModalBottomSheet<LocationFilter>(
      context: context,
      isScrollControlled: true,
      builder: (_) => LocationFilterSheet(current: _locationFilter),
    );
    if (picked != null) {
      setState(() {
        _locationFilter = picked;
        _nearby = true;
      });
      _applyFilters();
    }
  }

  void _applyFilters() => setState(() {});

  void _clearFilters() {
    setState(() {
      _today = false;
      _nearby = false;
      _locationFilter = null;
    });
    _applyFilters();
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          floating: false,
          toolbarHeight: 56,
          titleSpacing: 12,
          title: FilterChipsBar(
            sort: _sort,
            today: _today,
            nearby: _nearby,
            onSortChanged: (s) {
              setState(() => _sort = s);
              _applyFilters();
            },
            onTodayChanged: (v) {
              setState(() => _today = v);
              _applyFilters();
            },
            onNearbyPressed: _pickLocationFilter,
            onClear: (_today || _nearby) ? _clearFilters : null,
          ),
          elevation: 4,
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childCount: _view.length,
              itemBuilder: (context, i) {
                final q = _view[i];
                final author = (q.authorName ?? '').trim();
                final meta = [
                  if (author.isNotEmpty) author,
                  timeAgo(q.createdAt),
                ].join(' · ');
                return FlamboyantQuoteCard(
                  quote: q,
                  meta: meta,
                  onVoteUp: () async {
                    await _vote(q, true);
                    _applyFilters();
                  },
                  onVoteDown: () async {
                    await _vote(q, false);
                    _applyFilters();
                  },
                  staticMapUrlBuilder: gStaticMap,
                );
              },
            )),
      ],
    );
  }
}
