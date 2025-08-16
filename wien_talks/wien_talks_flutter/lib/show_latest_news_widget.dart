import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';

class ShowLatestNewsWidget extends StatefulWidget {
  const ShowLatestNewsWidget({super.key});
  @override
  State<ShowLatestNewsWidget> createState() => _ShowLatestNewsWidgetState();
}

class _ShowLatestNewsWidgetState extends State<ShowLatestNewsWidget> {
  final _controller = StreamController<List<Quote>>.broadcast();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _reload();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _reload());
  }

  Future<void> _reload() async {
    try {
      final quotes = await FunmapMgr().client.quote.getAllQuotes(limit: 200);
      _controller.add(quotes);
    } catch (e, st) {
      _controller.addError(e, st);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _reload,
      child: StreamBuilder<List<Quote>>(
        stream: _controller.stream,
        initialData: const <Quote>[],
        builder: (context, snap) {
          if (snap.hasError) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Error: ${snap.error}'),
                ),
              ],
            );
          }
          final quotes = snap.data ?? const <Quote>[];
          if (quotes.isEmpty) {
            return ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('No quotes yet. Pull to refresh.'),
                ),
              ],
            );
          }
          return ListView.separated(
            itemCount: quotes.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final q = quotes[i];
              return ListTile(
                title: Text(q.text),
                subtitle: Text([
                  if ((q.authorName ?? '').isNotEmpty) q.authorName!,
                  q.createdAt.toLocal().toString(),
                ].where((e) => e.isNotEmpty).join(' · ')),
              );
            },
          );
        },
      ),
    );
  }
}
