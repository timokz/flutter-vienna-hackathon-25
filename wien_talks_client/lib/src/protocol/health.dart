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

abstract class Health implements _i1.SerializableModel {
  Health._({
    this.id,
    required this.createdAt,
    this.note,
  });

  factory Health({
    int? id,
    required DateTime createdAt,
    String? note,
  }) = _HealthImpl;

  factory Health.fromJson(Map<String, dynamic> jsonSerialization) {
    return Health(
      id: jsonSerialization['id'] as int?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      note: jsonSerialization['note'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String? note;

  /// Returns a shallow copy of this [Health]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Health copyWith({
    int? id,
    DateTime? createdAt,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      if (note != null) 'note': note,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HealthImpl extends Health {
  _HealthImpl({
    int? id,
    required DateTime createdAt,
    String? note,
  }) : super._(
          id: id,
          createdAt: createdAt,
          note: note,
        );

  /// Returns a shallow copy of this [Health]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Health copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    Object? note = _Undefined,
  }) {
    return Health(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      note: note is String? ? note : this.note,
    );
  }
}
