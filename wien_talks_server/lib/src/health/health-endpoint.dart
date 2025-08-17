import 'package:serverpod/serverpod.dart';
import 'package:wien_talks_server/src/generated/protocol.dart';

class HealthEndpoint extends Endpoint {
  Future<Health> ping(Session session, {String? note}) async {
    final row = await Health.db.insertRow(
      session,
      Health(
        createdAt: DateTime.now().toUtc(),
        note: note,
      ),
    );
    return row;
  }

  Future<List<Health>> all(Session session) {
    return Health.db.find(
      session,
      orderBy: (h) => h.createdAt,
      orderDescending: true,
    );
  }
}
