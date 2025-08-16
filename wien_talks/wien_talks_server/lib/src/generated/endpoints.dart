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
import '../quotes/quotes_endpoint.dart' as _i2;
import 'package:wien_talks_server/src/generated/quotes/quote.dart' as _i3;
import 'package:wien_talks_server/src/generated/quotes/create_quote.dart'
    as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'quote': _i2.QuoteEndpoint()
        ..initialize(
          server,
          'quote',
          null,
        )
    };
    connectors['quote'] = _i1.EndpointConnector(
      name: 'quote',
      endpoint: endpoints['quote']!,
      methodConnectors: {
        'updateQuote': _i1.MethodConnector(
          name: 'updateQuote',
          params: {
            'quote': _i1.ParameterDescription(
              name: 'quote',
              type: _i1.getType<_i3.Quote>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i2.QuoteEndpoint).updateQuote(
            session,
            params['quote'],
          ),
        ),
        'createQuote': _i1.MethodConnector(
          name: 'createQuote',
          params: {
            'req': _i1.ParameterDescription(
              name: 'req',
              type: _i1.getType<_i4.CreateQuoteRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i2.QuoteEndpoint).createQuote(
            session,
            params['req'],
          ),
        ),
        'getQuoteById': _i1.MethodConnector(
          name: 'getQuoteById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i2.QuoteEndpoint).getQuoteById(
            session,
            params['id'],
          ),
        ),
        'getAllQuotes': _i1.MethodConnector(
          name: 'getAllQuotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i2.QuoteEndpoint).getAllQuotes(session),
        ),
        'quoteUpdates': _i1.MethodStreamConnector(
          name: 'quoteUpdates',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['quote'] as _i2.QuoteEndpoint).quoteUpdates(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
