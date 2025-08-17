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

abstract class Vote implements _i1.SerializableModel {
  Vote._({
    this.id,
    required this.userId,
    required this.createdAt,
    required this.quoteId,
    required this.upvote,
  });

  factory Vote({
    int? id,
    required int userId,
    required DateTime createdAt,
    required int quoteId,
    required bool upvote,
  }) = _VoteImpl;

  factory Vote.fromJson(Map<String, dynamic> jsonSerialization) {
    return Vote(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      quoteId: jsonSerialization['quoteId'] as int,
      upvote: jsonSerialization['upvote'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  DateTime createdAt;

  int quoteId;

  bool upvote;

  /// Returns a shallow copy of this [Vote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Vote copyWith({
    int? id,
    int? userId,
    DateTime? createdAt,
    int? quoteId,
    bool? upvote,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'quoteId': quoteId,
      'upvote': upvote,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VoteImpl extends Vote {
  _VoteImpl({
    int? id,
    required int userId,
    required DateTime createdAt,
    required int quoteId,
    required bool upvote,
  }) : super._(
          id: id,
          userId: userId,
          createdAt: createdAt,
          quoteId: quoteId,
          upvote: upvote,
        );

  /// Returns a shallow copy of this [Vote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Vote copyWith({
    Object? id = _Undefined,
    int? userId,
    DateTime? createdAt,
    int? quoteId,
    bool? upvote,
  }) {
    return Vote(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      quoteId: quoteId ?? this.quoteId,
      upvote: upvote ?? this.upvote,
    );
  }
}
