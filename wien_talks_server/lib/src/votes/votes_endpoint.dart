import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';

class VotesEndpoint extends Endpoint {
  Future<List<Vote>> getAllVotes(Session session) async {
    return await Vote.db.find(
      session,
      orderBy: (v) => v.createdAt,
      orderDescending: true,
    );
  }

  Future<String> createVote(Session session) async {
    final vote = await Vote.db.insertRow(
        session,
        Vote(
            userId: Random().nextInt(122),
            createdAt: DateTime.now(),
            quoteId: Random().nextInt(122),
            upvote: true));

    return '${vote.id}';
  }

  Future<String> sayHello(Session session) async {
    return 'hello';
  }
}
