/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../health/health-endpoint.dart' as _i2;
import '../quotes/quotes_endpoint.dart' as _i3;
import '../votes/votes_endpoint.dart' as _i4;
import 'package:wien_talks_server/src/generated/create_quote.dart' as _i5;
import 'package:wien_talks_server/src/generated/quote.dart' as _i6;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'health': _i2.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'quote': _i3.QuoteEndpoint()
        ..initialize(
          server,
          'quote',
          null,
        ),
      'votes': _i4.VotesEndpoint()
        ..initialize(
          server,
          'votes',
          null,
        ),
    };
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'ping': _i1.MethodConnector(
          name: 'ping',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i2.HealthEndpoint).ping(
            session,
            note: params['note'],
          ),
        ),
        'all': _i1.MethodConnector(
          name: 'all',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i2.HealthEndpoint).all(session),
        ),
      },
    );
    connectors['quote'] = _i1.EndpointConnector(
      name: 'quote',
      endpoint: endpoints['quote']!,
      methodConnectors: {
        'createQuote': _i1.MethodConnector(
          name: 'createQuote',
          params: {
            'req': _i1.ParameterDescription(
              name: 'req',
              type: _i1.getType<_i5.CreateQuoteRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).createQuote(
            session,
            params['req'],
          ),
        ),
        'updateQuote': _i1.MethodConnector(
          name: 'updateQuote',
          params: {
            'quote': _i1.ParameterDescription(
              name: 'quote',
              type: _i1.getType<_i6.Quote>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).updateQuote(
            session,
            params['quote'],
          ),
        ),
        'getAllQuotes': _i1.MethodConnector(
          name: 'getAllQuotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).getAllQuotes(session),
        ),
        'streamAllQuotes': _i1.MethodStreamConnector(
          name: 'streamAllQuotes',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['quote'] as _i3.QuoteEndpoint).streamAllQuotes(
            session,
            limit: params['limit'],
          ),
        ),
      },
    );
    connectors['votes'] = _i1.EndpointConnector(
      name: 'votes',
      endpoint: endpoints['votes']!,
      methodConnectors: {
        'getAllVotes': _i1.MethodConnector(
          name: 'getAllVotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['votes'] as _i4.VotesEndpoint).getAllVotes(session),
        ),
        'createVote': _i1.MethodConnector(
          name: 'createVote',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['votes'] as _i4.VotesEndpoint).createVote(session),
        ),
        'sayHello': _i1.MethodConnector(
          name: 'sayHello',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['votes'] as _i4.VotesEndpoint).sayHello(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
