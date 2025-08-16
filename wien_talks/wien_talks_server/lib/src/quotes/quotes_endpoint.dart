import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';
import 'package:wien_talks_server/src/quotes/quote_util.dart';

class QuoteEndpoint extends Endpoint {
  static const _channelQuoteUpdates = 'quote-updates';

  Future<void> updateQuote(Session session, Quote quote) async {
    await Quote.db.updateRow(session, quote);
    await session.messages.postMessage(_channelQuoteUpdates, quote);
  }

  Stream<Quote> quoteUpdates(Session session) async* {
    var updateStream =
        session.messages.createStream<Quote>(_channelQuoteUpdates);

    await for (var quote in updateStream) {
      yield quote;
    }
  }

  Future<Quote> createQuote(Session session, CreateQuoteRequest req) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Not signed in');
    }

    String text = validateQuote(req);

    final quote = Quote(
      id: 0,
      userId: userId,
      text: text,
      authorName: req.authorName?.trim().isEmpty == true
          ? null
          : req.authorName!.trim(),
      lat: req.lat,
      long: req.lng,
      createdAt: DateTime.now().toUtc(),
      visibility: 0,
      upvotes: 0,
      downvotes: 0,
    );

    final inserted = await session.db.insertRow<Quote>(quote);
    await session.messages.postMessage(_channelQuoteUpdates, quote);

    return inserted;
  }

  Future<Quote> getQuoteById(Session session, int id) async {
    final quote = await Quote.db.findById(session, id);
    if (quote != null) {
      return quote;
    }

    throw Exception('Quote not found');
  }

// Only for dev
  Future<List<Quote>> getAllQuotes(Session session) async {
    final quotes = await Quote.db.find(session);
    return quotes;
  }

  Stream streamAllQuotes(
    StreamingSession session, {
    int limit = 200,
  }) async* {
    if (limit <= 0 || limit > 500) limit = 200;

    final quoteStream = session.messages.createStream('quotes');

    await for (final Quote quote in quoteStream) {
      yield quote;
    }
  }
}
