/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:wien_talks_client/src/protocol/health.dart' as _i3;
import 'package:wien_talks_client/src/protocol/quote.dart' as _i4;
import 'package:wien_talks_client/src/protocol/create_quote.dart' as _i5;
import 'package:wien_talks_client/src/protocol/vote.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointHealth extends _i1.EndpointRef {
  EndpointHealth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  _i2.Future<_i3.Health> ping({String? note}) =>
      caller.callServerEndpoint<_i3.Health>(
        'health',
        'ping',
        {'note': note},
      );

  _i2.Future<List<_i3.Health>> all() =>
      caller.callServerEndpoint<List<_i3.Health>>(
        'health',
        'all',
        {},
      );
}

/// {@category Endpoint}
class EndpointQuote extends _i1.EndpointRef {
  EndpointQuote(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quote';

  _i2.Future<_i4.Quote> createQuote(_i5.CreateQuoteRequest req) =>
      caller.callServerEndpoint<_i4.Quote>(
        'quote',
        'createQuote',
        {'req': req},
      );

  _i2.Future<void> updateQuote(_i4.Quote quote) =>
      caller.callServerEndpoint<void>(
        'quote',
        'updateQuote',
        {'quote': quote},
      );

  _i2.Future<List<_i4.Quote>> getAllQuotes() =>
      caller.callServerEndpoint<List<_i4.Quote>>(
        'quote',
        'getAllQuotes',
        {},
      );

  _i2.Stream<_i4.Quote> streamAllQuotes({required int limit}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.Quote>, _i4.Quote>(
        'quote',
        'streamAllQuotes',
        {'limit': limit},
        {},
      );
}

/// {@category Endpoint}
class EndpointVotes extends _i1.EndpointRef {
  EndpointVotes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'votes';

  _i2.Future<List<_i6.Vote>> getAllVotes() =>
      caller.callServerEndpoint<List<_i6.Vote>>(
        'votes',
        'getAllVotes',
        {},
      );

  _i2.Future<String> createVote() => caller.callServerEndpoint<String>(
        'votes',
        'createVote',
        {},
      );

  _i2.Future<String> sayHello() => caller.callServerEndpoint<String>(
        'votes',
        'sayHello',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    health = EndpointHealth(this);
    quote = EndpointQuote(this);
    votes = EndpointVotes(this);
    modules = Modules(this);
  }

  late final EndpointHealth health;

  late final EndpointQuote quote;

  late final EndpointVotes votes;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'health': health,
        'quote': quote,
        'votes': votes,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
