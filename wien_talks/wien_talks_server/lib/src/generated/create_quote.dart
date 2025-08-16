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

abstract class CreateQuoteRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateQuoteRequest._({
    required this.text,
    this.authorName,
    required this.lat,
    required this.lng,
    this.tags,
  });

  factory CreateQuoteRequest({
    required String text,
    String? authorName,
    required double lat,
    required double lng,
    List<String>? tags,
  }) = _CreateQuoteRequestImpl;

  factory CreateQuoteRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateQuoteRequest(
      text: jsonSerialization['text'] as String,
      authorName: jsonSerialization['authorName'] as String?,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  String text;

  String? authorName;

  double lat;

  double lng;

  List<String>? tags;

  /// Returns a shallow copy of this [CreateQuoteRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateQuoteRequest copyWith({
    String? text,
    String? authorName,
    double? lat,
    double? lng,
    List<String>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      if (authorName != null) 'authorName': authorName,
      'lat': lat,
      'lng': lng,
      if (tags != null) 'tags': tags?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'text': text,
      if (authorName != null) 'authorName': authorName,
      'lat': lat,
      'lng': lng,
      if (tags != null) 'tags': tags?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateQuoteRequestImpl extends CreateQuoteRequest {
  _CreateQuoteRequestImpl({
    required String text,
    String? authorName,
    required double lat,
    required double lng,
    List<String>? tags,
  }) : super._(
          text: text,
          authorName: authorName,
          lat: lat,
          lng: lng,
          tags: tags,
        );

  /// Returns a shallow copy of this [CreateQuoteRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateQuoteRequest copyWith({
    String? text,
    Object? authorName = _Undefined,
    double? lat,
    double? lng,
    Object? tags = _Undefined,
  }) {
    return CreateQuoteRequest(
      text: text ?? this.text,
      authorName: authorName is String? ? authorName : this.authorName,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
    );
  }
}
