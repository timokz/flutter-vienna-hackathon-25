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

abstract class Quote implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = QuoteTable();

  static const db = QuoteRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static QuoteInclude include() {
    return QuoteInclude._();
  }

  static QuoteIncludeList includeList({
    _i1.WhereExpressionBuilder<QuoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuoteTable>? orderByList,
    QuoteInclude? include,
  }) {
    return QuoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quote.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quote.t),
      include: include,
    );
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

class QuoteTable extends _i1.Table<int?> {
  QuoteTable({super.tableRelation}) : super(tableName: 'quote') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    authorName = _i1.ColumnString(
      'authorName',
      this,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
    );
    long = _i1.ColumnDouble(
      'long',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    visibility = _i1.ColumnInt(
      'visibility',
      this,
    );
    upvotes = _i1.ColumnInt(
      'upvotes',
      this,
    );
    downvotes = _i1.ColumnInt(
      'downvotes',
      this,
    );
    tags = _i1.ColumnSerializable(
      'tags',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString text;

  late final _i1.ColumnString authorName;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble long;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt visibility;

  late final _i1.ColumnInt upvotes;

  late final _i1.ColumnInt downvotes;

  late final _i1.ColumnSerializable tags;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        text,
        authorName,
        lat,
        long,
        createdAt,
        visibility,
        upvotes,
        downvotes,
        tags,
      ];
}

class QuoteInclude extends _i1.IncludeObject {
  QuoteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Quote.t;
}

class QuoteIncludeList extends _i1.IncludeList {
  QuoteIncludeList._({
    _i1.WhereExpressionBuilder<QuoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quote.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Quote.t;
}

class QuoteRepository {
  const QuoteRepository._();

  /// Returns a list of [Quote]s matching the given query parameters.
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
  Future<List<Quote>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Quote>(
      where: where?.call(Quote.t),
      orderBy: orderBy?.call(Quote.t),
      orderByList: orderByList?.call(Quote.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Quote] matching the given query parameters.
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
  Future<Quote?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Quote>(
      where: where?.call(Quote.t),
      orderBy: orderBy?.call(Quote.t),
      orderByList: orderByList?.call(Quote.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Quote] by its [id] or null if no such row exists.
  Future<Quote?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Quote>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Quote]s in the list and returns the inserted rows.
  ///
  /// The returned [Quote]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Quote>> insert(
    _i1.Session session,
    List<Quote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Quote>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Quote] and returns the inserted row.
  ///
  /// The returned [Quote] will have its `id` field set.
  Future<Quote> insertRow(
    _i1.Session session,
    Quote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quote>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Quote]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Quote>> update(
    _i1.Session session,
    List<Quote> rows, {
    _i1.ColumnSelections<QuoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Quote>(
      rows,
      columns: columns?.call(Quote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Quote]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Quote> updateRow(
    _i1.Session session,
    Quote row, {
    _i1.ColumnSelections<QuoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quote>(
      row,
      columns: columns?.call(Quote.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Quote]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Quote>> delete(
    _i1.Session session,
    List<Quote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quote>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Quote].
  Future<Quote> deleteRow(
    _i1.Session session,
    Quote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quote>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Quote>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Quote>(
      where: where(Quote.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quote>(
      where: where?.call(Quote.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
