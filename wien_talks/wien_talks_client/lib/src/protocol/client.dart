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
import 'package:wien_talks_client/src/protocol/quotes/quote.dart' as _i3;
import 'package:wien_talks_client/src/protocol/quotes/create_quote.dart' as _i4;
import 'package:wien_talks_client/src/protocol/votes/vote.dart' as _i5;
import 'package:wien_talks_client/src/protocol/votes/vote_request.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointQuote extends _i1.EndpointRef {
  EndpointQuote(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quote';

  _i2.Future<_i3.Quote> createQuote(_i4.CreateQuoteRequest req) =>
      caller.callServerEndpoint<_i3.Quote>(
        'quote',
        'createQuote',
        {'req': req},
      );

  _i2.Future<void> updateQuote(_i3.Quote quote) =>
      caller.callServerEndpoint<void>(
        'quote',
        'updateQuote',
        {'quote': quote},
      );

  _i2.Future<List<_i3.Quote>> getAllQuotes() =>
      caller.callServerEndpoint<List<_i3.Quote>>(
        'quote',
        'getAllQuotes',
        {},
      );
}

/// {@category Endpoint}
class EndpointVotes extends _i1.EndpointRef {
  EndpointVotes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'votes';

  _i2.Future<_i5.Vote> postVote(_i6.VoteRequest voteRequest) =>
      caller.callServerEndpoint<_i5.Vote>(
        'votes',
        'postVote',
        {'voteRequest': voteRequest},
      );

  _i2.Future<List<_i5.Vote>> getAllVotes() =>
      caller.callServerEndpoint<List<_i5.Vote>>(
        'votes',
        'getAllVotes',
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
    quote = EndpointQuote(this);
    votes = EndpointVotes(this);
    modules = Modules(this);
  }

  late final EndpointQuote quote;

  late final EndpointVotes votes;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'quote': quote,
        'votes': votes,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
