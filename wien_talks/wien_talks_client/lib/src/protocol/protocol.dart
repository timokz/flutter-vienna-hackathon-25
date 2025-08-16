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
import 'create_quote.dart' as _i2;
import 'health.dart' as _i3;
import 'quote.dart' as _i4;
import 'vote.dart' as _i5;
import 'package:wien_talks_client/src/protocol/health.dart' as _i6;
import 'package:wien_talks_client/src/protocol/quote.dart' as _i7;
import 'package:wien_talks_client/src/protocol/vote.dart' as _i8;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i9;
export 'create_quote.dart';
export 'health.dart';
export 'quote.dart';
export 'vote.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CreateQuoteRequest) {
      return _i2.CreateQuoteRequest.fromJson(data) as T;
    }
    if (t == _i3.Health) {
      return _i3.Health.fromJson(data) as T;
    }
    if (t == _i4.Quote) {
      return _i4.Quote.fromJson(data) as T;
    }
    if (t == _i5.Vote) {
      return _i5.Vote.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CreateQuoteRequest?>()) {
      return (data != null ? _i2.CreateQuoteRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Health?>()) {
      return (data != null ? _i3.Health.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Quote?>()) {
      return (data != null ? _i4.Quote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Vote?>()) {
      return (data != null ? _i5.Vote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i6.Health>) {
      return (data as List).map((e) => deserialize<_i6.Health>(e)).toList()
          as T;
    }
    if (t == List<_i7.Quote>) {
      return (data as List).map((e) => deserialize<_i7.Quote>(e)).toList() as T;
    }
    if (t == List<_i8.Vote>) {
      return (data as List).map((e) => deserialize<_i8.Vote>(e)).toList() as T;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CreateQuoteRequest) {
      return 'CreateQuoteRequest';
    }
    if (data is _i3.Health) {
      return 'Health';
    }
    if (data is _i4.Quote) {
      return 'Quote';
    }
    if (data is _i5.Vote) {
      return 'Vote';
    }
    className = _i9.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CreateQuoteRequest') {
      return deserialize<_i2.CreateQuoteRequest>(data['data']);
    }
    if (dataClassName == 'Health') {
      return deserialize<_i3.Health>(data['data']);
    }
    if (dataClassName == 'Quote') {
      return deserialize<_i4.Quote>(data['data']);
    }
    if (dataClassName == 'Vote') {
      return deserialize<_i5.Vote>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i9.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
