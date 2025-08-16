import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';
import 'package:wien_talks_server/src/quotes/quote_controller.dart';

class QuoteEndpoint extends Endpoint {
  Future<Quote> create(Session session, CreateQuoteRequest req) async {
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
    return inserted;
  }

  Future<Quote> getQuoteById(Session session, int id) async {
    final quote = await Quote.db.findById(session, id);
    if (quote != null) {
      return quote;
    }

    throw Exception('Quote not found');
  }
}
