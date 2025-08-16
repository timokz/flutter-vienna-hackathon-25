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
import '../quotes/quote.dart' as _i2;

abstract class VoteRequest implements _i1.SerializableModel {
  VoteRequest._({
    this.id,
    required this.userId,
    required this.quote,
    required this.upvote,
  });

  factory VoteRequest({
    int? id,
    required int userId,
    required _i2.Quote quote,
    required bool upvote,
  }) = _VoteRequestImpl;

  factory VoteRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return VoteRequest(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      quote: _i2.Quote.fromJson(
          (jsonSerialization['quote'] as Map<String, dynamic>)),
      upvote: jsonSerialization['upvote'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.Quote quote;

  bool upvote;

  /// Returns a shallow copy of this [VoteRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VoteRequest copyWith({
    int? id,
    int? userId,
    _i2.Quote? quote,
    bool? upvote,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'quote': quote.toJson(),
      'upvote': upvote,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VoteRequestImpl extends VoteRequest {
  _VoteRequestImpl({
    int? id,
    required int userId,
    required _i2.Quote quote,
    required bool upvote,
  }) : super._(
          id: id,
          userId: userId,
          quote: quote,
          upvote: upvote,
        );

  /// Returns a shallow copy of this [VoteRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VoteRequest copyWith({
    Object? id = _Undefined,
    int? userId,
    _i2.Quote? quote,
    bool? upvote,
  }) {
    return VoteRequest(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      quote: quote ?? this.quote.copyWith(),
      upvote: upvote ?? this.upvote,
    );
  }
}
