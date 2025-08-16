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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointQuote extends _i1.EndpointRef {
  EndpointQuote(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quote';

  _i2.Future<void> updateQuote(_i3.Quote quote) =>
      caller.callServerEndpoint<void>(
        'quote',
        'updateQuote',
        {'quote': quote},
      );

  _i2.Stream<_i3.Quote> quoteUpdates() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.Quote>, _i3.Quote>(
        'quote',
        'quoteUpdates',
        {},
        {},
      );

  _i2.Future<_i3.Quote> createQuote(_i4.CreateQuoteRequest req) =>
      caller.callServerEndpoint<_i3.Quote>(
        'quote',
        'createQuote',
        {'req': req},
      );

  _i2.Future<_i3.Quote> getQuoteById(int id) =>
      caller.callServerEndpoint<_i3.Quote>(
        'quote',
        'getQuoteById',
        {'id': id},
      );

  _i2.Future<List<_i3.Quote>> getAllQuotes() =>
      caller.callServerEndpoint<List<_i3.Quote>>(
        'quote',
        'getAllQuotes',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
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
          _i6.Protocol(),
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
    modules = Modules(this);
  }

  late final EndpointQuote quote;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'quote': quote};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
