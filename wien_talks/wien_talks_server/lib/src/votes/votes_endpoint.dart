import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';

class VotesEndpoint extends Endpoint {
  Future<Vote> postVote(Session session, VoteRequest voteRequest) async {
    final row = Vote(
        createdAt: DateTime.now(),
        quote: voteRequest.quote,
        upvote: voteRequest.upvote,
        userId: voteRequest.userId);

    final persistedVote = await Vote.db.insertRow(session, row);

    return persistedVote;
  }

  Future<List<Vote>> getAllVotes(Session session) async {
    final rows = Vote.db.find(session, limit: 50);
    return rows;
  }
}
