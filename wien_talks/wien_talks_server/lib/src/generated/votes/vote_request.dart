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
import '../quotes/quote.dart' as _i2;

abstract class VoteRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = VoteRequestTable();

  static const db = VoteRequestRepository._();

  @override
  int? id;

  int userId;

  _i2.Quote quote;

  bool upvote;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'quote': quote.toJsonForProtocol(),
      'upvote': upvote,
    };
  }

  static VoteRequestInclude include() {
    return VoteRequestInclude._();
  }

  static VoteRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<VoteRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoteRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteRequestTable>? orderByList,
    VoteRequestInclude? include,
  }) {
    return VoteRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VoteRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VoteRequest.t),
      include: include,
    );
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

class VoteRequestTable extends _i1.Table<int?> {
  VoteRequestTable({super.tableRelation}) : super(tableName: 'vote_request') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    quote = _i1.ColumnSerializable(
      'quote',
      this,
    );
    upvote = _i1.ColumnBool(
      'upvote',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnSerializable quote;

  late final _i1.ColumnBool upvote;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        quote,
        upvote,
      ];
}

class VoteRequestInclude extends _i1.IncludeObject {
  VoteRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => VoteRequest.t;
}

class VoteRequestIncludeList extends _i1.IncludeList {
  VoteRequestIncludeList._({
    _i1.WhereExpressionBuilder<VoteRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VoteRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => VoteRequest.t;
}

class VoteRequestRepository {
  const VoteRequestRepository._();

  /// Returns a list of [VoteRequest]s matching the given query parameters.
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
  Future<List<VoteRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoteRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<VoteRequest>(
      where: where?.call(VoteRequest.t),
      orderBy: orderBy?.call(VoteRequest.t),
      orderByList: orderByList?.call(VoteRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [VoteRequest] matching the given query parameters.
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
  Future<VoteRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<VoteRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoteRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<VoteRequest>(
      where: where?.call(VoteRequest.t),
      orderBy: orderBy?.call(VoteRequest.t),
      orderByList: orderByList?.call(VoteRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [VoteRequest] by its [id] or null if no such row exists.
  Future<VoteRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<VoteRequest>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [VoteRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [VoteRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VoteRequest>> insert(
    _i1.Session session,
    List<VoteRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VoteRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VoteRequest] and returns the inserted row.
  ///
  /// The returned [VoteRequest] will have its `id` field set.
  Future<VoteRequest> insertRow(
    _i1.Session session,
    VoteRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VoteRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VoteRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VoteRequest>> update(
    _i1.Session session,
    List<VoteRequest> rows, {
    _i1.ColumnSelections<VoteRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VoteRequest>(
      rows,
      columns: columns?.call(VoteRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VoteRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VoteRequest> updateRow(
    _i1.Session session,
    VoteRequest row, {
    _i1.ColumnSelections<VoteRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VoteRequest>(
      row,
      columns: columns?.call(VoteRequest.t),
      transaction: transaction,
    );
  }

  /// Deletes all [VoteRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VoteRequest>> delete(
    _i1.Session session,
    List<VoteRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VoteRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VoteRequest].
  Future<VoteRequest> deleteRow(
    _i1.Session session,
    VoteRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VoteRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VoteRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VoteRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VoteRequest>(
      where: where(VoteRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VoteRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VoteRequest>(
      where: where?.call(VoteRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
