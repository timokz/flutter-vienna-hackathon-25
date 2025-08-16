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

abstract class Vote implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = VoteTable();

  static const db = VoteRepository._();

  @override
  int? id;

  int userId;

  DateTime createdAt;

  int quoteId;

  bool upvote;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'quoteId': quoteId,
      'upvote': upvote,
    };
  }

  static VoteInclude include() {
    return VoteInclude._();
  }

  static VoteIncludeList includeList({
    _i1.WhereExpressionBuilder<VoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteTable>? orderByList,
    VoteInclude? include,
  }) {
    return VoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Vote.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Vote.t),
      include: include,
    );
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

class VoteTable extends _i1.Table<int?> {
  VoteTable({super.tableRelation}) : super(tableName: 'vote') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    quoteId = _i1.ColumnInt(
      'quoteId',
      this,
    );
    upvote = _i1.ColumnBool(
      'upvote',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt quoteId;

  late final _i1.ColumnBool upvote;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        createdAt,
        quoteId,
        upvote,
      ];
}

class VoteInclude extends _i1.IncludeObject {
  VoteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Vote.t;
}

class VoteIncludeList extends _i1.IncludeList {
  VoteIncludeList._({
    _i1.WhereExpressionBuilder<VoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Vote.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Vote.t;
}

class VoteRepository {
  const VoteRepository._();

  /// Returns a list of [Vote]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Vote>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Vote>(
      where: where?.call(Vote.t),
      orderBy: orderBy?.call(Vote.t),
      orderByList: orderByList?.call(Vote.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Vote] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Vote?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<VoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Vote>(
      where: where?.call(Vote.t),
      orderBy: orderBy?.call(Vote.t),
      orderByList: orderByList?.call(Vote.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Vote] by its [id] or null if no such row exists.
  Future<Vote?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Vote>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Vote]s in the list and returns the inserted rows.
  ///
  /// The returned [Vote]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Vote>> insert(
    _i1.Session session,
    List<Vote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Vote>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Vote] and returns the inserted row.
  ///
  /// The returned [Vote] will have its `id` field set.
  Future<Vote> insertRow(
    _i1.Session session,
    Vote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Vote>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Vote]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Vote>> update(
    _i1.Session session,
    List<Vote> rows, {
    _i1.ColumnSelections<VoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Vote>(
      rows,
      columns: columns?.call(Vote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Vote]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Vote> updateRow(
    _i1.Session session,
    Vote row, {
    _i1.ColumnSelections<VoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Vote>(
      row,
      columns: columns?.call(Vote.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Vote]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Vote>> delete(
    _i1.Session session,
    List<Vote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Vote>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Vote].
  Future<Vote> deleteRow(
    _i1.Session session,
    Vote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Vote>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Vote>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Vote>(
      where: where(Vote.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Vote>(
      where: where?.call(Vote.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
