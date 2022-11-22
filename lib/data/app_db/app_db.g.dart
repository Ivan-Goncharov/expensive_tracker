// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NoteOperationData extends DataClass
    implements Insertable<NoteOperationData> {
  final int id;
  final String category;
  final String type;
  final DateTime dateOperation;
  final double amount;
  const NoteOperationData(
      {required this.id,
      required this.category,
      required this.type,
      required this.dateOperation,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation_category'] = Variable<String>(category);
    map['operation_type'] = Variable<String>(type);
    map['operation_date'] = Variable<DateTime>(dateOperation);
    map['operation_amount'] = Variable<double>(amount);
    return map;
  }

  NoteOperationCompanion toCompanion(bool nullToAbsent) {
    return NoteOperationCompanion(
      id: Value(id),
      category: Value(category),
      type: Value(type),
      dateOperation: Value(dateOperation),
      amount: Value(amount),
    );
  }

  factory NoteOperationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteOperationData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      type: serializer.fromJson<String>(json['type']),
      dateOperation: serializer.fromJson<DateTime>(json['dateOperation']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'type': serializer.toJson<String>(type),
      'dateOperation': serializer.toJson<DateTime>(dateOperation),
      'amount': serializer.toJson<double>(amount),
    };
  }

  NoteOperationData copyWith(
          {int? id,
          String? category,
          String? type,
          DateTime? dateOperation,
          double? amount}) =>
      NoteOperationData(
        id: id ?? this.id,
        category: category ?? this.category,
        type: type ?? this.type,
        dateOperation: dateOperation ?? this.dateOperation,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('NoteOperationData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('dateOperation: $dateOperation, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, type, dateOperation, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteOperationData &&
          other.id == this.id &&
          other.category == this.category &&
          other.type == this.type &&
          other.dateOperation == this.dateOperation &&
          other.amount == this.amount);
}

class NoteOperationCompanion extends UpdateCompanion<NoteOperationData> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> type;
  final Value<DateTime> dateOperation;
  final Value<double> amount;
  const NoteOperationCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    this.dateOperation = const Value.absent(),
    this.amount = const Value.absent(),
  });
  NoteOperationCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String type,
    required DateTime dateOperation,
    required double amount,
  })  : category = Value(category),
        type = Value(type),
        dateOperation = Value(dateOperation),
        amount = Value(amount);
  static Insertable<NoteOperationData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? type,
    Expression<DateTime>? dateOperation,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'operation_category': category,
      if (type != null) 'operation_type': type,
      if (dateOperation != null) 'operation_date': dateOperation,
      if (amount != null) 'operation_amount': amount,
    });
  }

  NoteOperationCompanion copyWith(
      {Value<int>? id,
      Value<String>? category,
      Value<String>? type,
      Value<DateTime>? dateOperation,
      Value<double>? amount}) {
    return NoteOperationCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      type: type ?? this.type,
      dateOperation: dateOperation ?? this.dateOperation,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['operation_category'] = Variable<String>(category.value);
    }
    if (type.present) {
      map['operation_type'] = Variable<String>(type.value);
    }
    if (dateOperation.present) {
      map['operation_date'] = Variable<DateTime>(dateOperation.value);
    }
    if (amount.present) {
      map['operation_amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteOperationCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('dateOperation: $dateOperation, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $NoteOperationTable extends NoteOperation
    with TableInfo<$NoteOperationTable, NoteOperationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteOperationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'operation_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'operation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateOperationMeta =
      const VerificationMeta('dateOperation');
  @override
  late final GeneratedColumn<DateTime> dateOperation =
      GeneratedColumn<DateTime>('operation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'operation_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, category, type, dateOperation, amount];
  @override
  String get aliasedName => _alias ?? 'note_operation';
  @override
  String get actualTableName => 'note_operation';
  @override
  VerificationContext validateIntegrity(Insertable<NoteOperationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_category')) {
      context.handle(
          _categoryMeta,
          category.isAcceptableOrUnknown(
              data['operation_category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(_typeMeta,
          type.isAcceptableOrUnknown(data['operation_type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('operation_date')) {
      context.handle(
          _dateOperationMeta,
          dateOperation.isAcceptableOrUnknown(
              data['operation_date']!, _dateOperationMeta));
    } else if (isInserting) {
      context.missing(_dateOperationMeta);
    }
    if (data.containsKey('operation_amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['operation_amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteOperationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteOperationData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}operation_category'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}operation_type'])!,
      dateOperation: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}operation_date'])!,
      amount: attachedDatabase.options.types.read(
          DriftSqlType.double, data['${effectivePrefix}operation_amount'])!,
    );
  }

  @override
  $NoteOperationTable createAlias(String alias) {
    return $NoteOperationTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $NoteOperationTable noteOperation = $NoteOperationTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteOperation];
}
