import 'dart:async';

import 'package:serverpod/serverpod.dart';

class RecipeEndpoint extends Endpoint {
  Future<String> postQuote(Session session, String quote) async {
    // validate content

    // persist quote
    return Future.value('none');
  }
}
