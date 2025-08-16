import 'dart:async';
import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';
import 'package:wien_talks_server/src/quotes/quote_util.dart';

class QuoteEndpoint extends Endpoint {
  static const _channelQuoteUpdates = 'quote-updates';

  Future<String> dbPing(Session session) async {
    await session.db.unsafeQuery('SELECT 1;'); // connectivity
    await session.db
        .unsafeQuery('SELECT 1 FROM public.quote LIMIT 1;'); // table visible
    return 'ok';
  }

  Future<Quote> createQuote(Session session, CreateQuoteRequest req) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    final text = validateQuote(req);

    final toInsert = Quote(
      userId: userId ?? Random().nextInt(1200),
      text: text,
      authorName: req.authorName,
      lat: req.lat,
      long: req.lng,
      createdAt: DateTime.now().toUtc(),
      visibility: 0,
      upvotes: 0,
      downvotes: 0,
    );

    final inserted = await session.db.insertRow<Quote>(toInsert);
    await session.messages.postMessage(_channelQuoteUpdates, inserted);
    return inserted;
  }

  Future<void> updateQuote(Session session, Quote quote) async {
    await Quote.db.updateRow(session, quote);
    await session.messages.postMessage(_channelQuoteUpdates, quote);
  }

  Future<List<Quote>> getAllQuotes(
    Session session,
  ) async {
    session.log('$session');

    final quoteList = await Quote.db.find(
      session,
      // where: (t) => t.visibility.equals(0),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    for (var element in quoteList) {
      session.log(element.text);
    }

    return quoteList;
  }

  Future<Stream<Quote>> streamAllQuotes(StreamingSession session,
      {int limit = 200}) async {
    if (limit <= 0 || limit > 500) limit = 200;

    final controller = StreamController<Quote>();
    final live = session.messages.createStream<Quote>(_channelQuoteUpdates);
    final liveSub = live.listen(
      (q) {
        if (q.visibility == 0) controller.add(q);
      },
      onError: controller.addError,
      onDone: () {
        if (!controller.isClosed) controller.close();
      },
      cancelOnError: false,
    );

    () async* {
      try {
        final snapshot = await Quote.db.find(
          session,
          where: (t) => t.visibility.equals(0),
          orderBy: (t) => t.createdAt,
          orderDescending: true,
          limit: limit,
        );

        for (final q in snapshot.reversed) {
          controller.add(q);
        }
      } catch (e, st) {
        controller.addError(e, st);
      }
    }();

    await session.close().then((_) async {
      await liveSub.cancel();
      await controller.close();
    });

    return controller.stream;
  }
}
