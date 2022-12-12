// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NoteOperationCompanion extends UpdateCompanion<ItemOperationModel> {
  final Value<String> id;
  final Value<String> category;
  final Value<OperationType> type;
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
    required String id,
    required String category,
    required OperationType type,
    required DateTime dateOperation,
    required double amount,
  })  : id = Value(id),
        category = Value(category),
        type = Value(type),
        dateOperation = Value(dateOperation),
        amount = Value(amount);
  static Insertable<ItemOperationModel> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<int>? type,
    Expression<DateTime>? dateOperation,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'operation_category': category,
      if (type != null) 'type': type,
      if (dateOperation != null) 'operation_date': dateOperation,
      if (amount != null) 'operation_amount': amount,
    });
  }

  NoteOperationCompanion copyWith(
      {Value<String>? id,
      Value<String>? category,
      Value<OperationType>? type,
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
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['operation_category'] = Variable<String>(category.value);
    }
    if (type.present) {
      final converter = $NoteOperationTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
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

class _$ItemOperationModelInsertable implements Insertable<ItemOperationModel> {
  ItemOperationModel _object;

  _$ItemOperationModelInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return NoteOperationCompanion(
      id: Value(_object.id),
      category: Value(_object.category),
      amount: Value(_object.amount),
      type: Value(_object.type),
      dateOperation: Value(_object.dateOperation),
    ).toColumns(false);
  }
}

extension ItemOperationModelToInsertable on ItemOperationModel {
  _$ItemOperationModelInsertable toInsertable() {
    return _$ItemOperationModelInsertable(this);
  }
}

class $NoteOperationTable extends NoteOperation
    with TableInfo<$NoteOperationTable, ItemOperationModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteOperationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'operation_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<OperationType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<OperationType>($NoteOperationTable.$converter0);
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
  VerificationContext validateIntegrity(Insertable<ItemOperationModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('operation_category')) {
      context.handle(
          _categoryMeta,
          category.isAcceptableOrUnknown(
              data['operation_category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ItemOperationModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemOperationModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      category: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}operation_category'])!,
      amount: attachedDatabase.options.types.read(
          DriftSqlType.double, data['${effectivePrefix}operation_amount'])!,
      type: $NoteOperationTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      dateOperation: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}operation_date'])!,
    );
  }

  @override
  $NoteOperationTable createAlias(String alias) {
    return $NoteOperationTable(attachedDatabase, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const EnumIndexConverter<OperationType>(OperationType.values);
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
