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

abstract class Quote implements _i1.SerializableModel {
  Quote._({
    this.id,
    required this.userId,
    required this.text,
    this.authorName,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.visibility,
    required this.upvotes,
    required this.downvotes,
    this.tags,
  });

  factory Quote({
    int? id,
    required int userId,
    required String text,
    String? authorName,
    required double lat,
    required double long,
    required DateTime createdAt,
    required int visibility,
    required int upvotes,
    required int downvotes,
    List<String>? tags,
  }) = _QuoteImpl;

  factory Quote.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quote(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      text: jsonSerialization['text'] as String,
      authorName: jsonSerialization['authorName'] as String?,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      long: (jsonSerialization['long'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      visibility: jsonSerialization['visibility'] as int,
      upvotes: jsonSerialization['upvotes'] as int,
      downvotes: jsonSerialization['downvotes'] as int,
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String text;

  String? authorName;

  double lat;

  double long;

  DateTime createdAt;

  int visibility;

  int upvotes;

  int downvotes;

  List<String>? tags;

  /// Returns a shallow copy of this [Quote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quote copyWith({
    int? id,
    int? userId,
    String? text,
    String? authorName,
    double? lat,
    double? long,
    DateTime? createdAt,
    int? visibility,
    int? upvotes,
    int? downvotes,
    List<String>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'text': text,
      if (authorName != null) 'authorName': authorName,
      'lat': lat,
      'long': long,
      'createdAt': createdAt.toJson(),
      'visibility': visibility,
      'upvotes': upvotes,
      'downvotes': downvotes,
      if (tags != null) 'tags': tags?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuoteImpl extends Quote {
  _QuoteImpl({
    int? id,
    required int userId,
    required String text,
    String? authorName,
    required double lat,
    required double long,
    required DateTime createdAt,
    required int visibility,
    required int upvotes,
    required int downvotes,
    List<String>? tags,
  }) : super._(
          id: id,
          userId: userId,
          text: text,
          authorName: authorName,
          lat: lat,
          long: long,
          createdAt: createdAt,
          visibility: visibility,
          upvotes: upvotes,
          downvotes: downvotes,
          tags: tags,
        );

  /// Returns a shallow copy of this [Quote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quote copyWith({
    Object? id = _Undefined,
    int? userId,
    String? text,
    Object? authorName = _Undefined,
    double? lat,
    double? long,
    DateTime? createdAt,
    int? visibility,
    int? upvotes,
    int? downvotes,
    Object? tags = _Undefined,
  }) {
    return Quote(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      text: text ?? this.text,
      authorName: authorName is String? ? authorName : this.authorName,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      createdAt: createdAt ?? this.createdAt,
      visibility: visibility ?? this.visibility,
      upvotes: upvotes ?? this.upvotes,
      downvotes: downvotes ?? this.downvotes,
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
    );
  }
}
