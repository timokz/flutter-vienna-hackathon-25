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
import 'package:wien_talks_client/src/protocol/greeting.dart' as _i3;
import 'package:wien_talks_client/src/protocol/quotes/quote.dart' as _i4;
import 'package:wien_talks_client/src/protocol/quotes/create_quote.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i3.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i3.Greeting>(
        'greeting',
        'hello',
        {'name': name},
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

  _i2.Future<_i4.Quote> getQuoteById(int id) =>
      caller.callServerEndpoint<_i4.Quote>(
        'quote',
        'getQuoteById',
        {'id': id},
      );

  _i2.Future<List<_i4.Quote>> getAllQuotes() =>
      caller.callServerEndpoint<List<_i4.Quote>>(
        'quote',
        'getAllQuotes',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
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
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    greeting = EndpointGreeting(this);
    quote = EndpointQuote(this);
    modules = Modules(this);
  }

  late final EndpointGreeting greeting;

  late final EndpointQuote quote;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'greeting': greeting,
        'quote': quote,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
