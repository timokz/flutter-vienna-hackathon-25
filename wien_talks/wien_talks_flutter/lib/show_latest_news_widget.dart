import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';

class ShowLatestNewsWidget extends StatelessWidget {
  const ShowLatestNewsWidget({super.key});

  Future<List<Quote>> _load() async {
    final list = await FunmapMgr().client.quote.getAllQuotes();
    return list.whereType<Quote>().toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quote>>(
      future: _load(),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Error: ${snap.error}'),
            ),
          );
        }
        final quotes = snap.data ?? const <Quote>[];
        if (quotes.isEmpty) {
          return const Center(child: Text('No quotes yet.'));
        }

        return ListView.separated(
          itemCount: quotes.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final q = quotes[i];
            final author = (q.authorName ?? '').trim();
            final when = (q.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0))
                .toLocal()
                .toString();
            return ListTile(
              title: Text(q.text),
              subtitle: Text([
                if (author.isNotEmpty) author,
                when,
              ].join(' · ')),
            );
          },
        );
      },
    );
  }
}
