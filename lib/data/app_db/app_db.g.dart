// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CategoriesOperationTableCompanion
    extends UpdateCompanion<OperationCategories> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> code;
  final Value<OperationType> type;
  const CategoriesOperationTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.code = const Value.absent(),
    this.type = const Value.absent(),
  });
  CategoriesOperationTableCompanion.insert({
    required String id,
    required String title,
    required String code,
    required OperationType type,
  })  : id = Value(id),
        title = Value(title),
        code = Value(code),
        type = Value(type);
  static Insertable<OperationCategories> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? code,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (code != null) 'code': code,
      if (type != null) 'type': type,
    });
  }

  CategoriesOperationTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? code,
      Value<OperationType>? type}) {
    return CategoriesOperationTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (type.present) {
      final converter = $CategoriesOperationTableTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesOperationTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class _$OperationCategoriesInsertable
    implements Insertable<OperationCategories> {
  OperationCategories _object;

  _$OperationCategoriesInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CategoriesOperationTableCompanion(
      id: Value(_object.id),
      title: Value(_object.title),
      code: Value(_object.code),
      type: Value(_object.type),
    ).toColumns(false);
  }
}

extension OperationCategoriesToInsertable on OperationCategories {
  _$OperationCategoriesInsertable toInsertable() {
    return _$OperationCategoriesInsertable(this);
  }
}

class $CategoriesOperationTableTable extends CategoriesOperationTable
    with TableInfo<$CategoriesOperationTableTable, OperationCategories> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesOperationTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<OperationType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<OperationType>(
              $CategoriesOperationTableTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [id, title, code, type];
  @override
  String get aliasedName => _alias ?? 'categories_operation_table';
  @override
  String get actualTableName => 'categories_operation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OperationCategories> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OperationCategories map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationCategories(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      type: $CategoriesOperationTableTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $CategoriesOperationTableTable createAlias(String alias) {
    return $CategoriesOperationTableTable(attachedDatabase, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const EnumIndexConverter<OperationType>(OperationType.values);
}

class NoteOperationCompanion extends UpdateCompanion<ItemOperationModel> {
  final Value<String> id;
  final Value<String> category;
  final Value<double> amount;
  final Value<OperationType> type;
  final Value<DateTime> dateOperation;
  const NoteOperationCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.dateOperation = const Value.absent(),
  });
  NoteOperationCompanion.insert({
    required String id,
    required String category,
    required double amount,
    required OperationType type,
    required DateTime dateOperation,
  })  : id = Value(id),
        category = Value(category),
        amount = Value(amount),
        type = Value(type),
        dateOperation = Value(dateOperation);
  static Insertable<ItemOperationModel> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<int>? type,
    Expression<DateTime>? dateOperation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (amount != null) 'operation_amount': amount,
      if (type != null) 'type': type,
      if (dateOperation != null) 'operation_date': dateOperation,
    });
  }

  NoteOperationCompanion copyWith(
      {Value<String>? id,
      Value<String>? category,
      Value<double>? amount,
      Value<OperationType>? type,
      Value<DateTime>? dateOperation}) {
    return NoteOperationCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      dateOperation: dateOperation ?? this.dateOperation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['operation_amount'] = Variable<double>(amount.value);
    }
    if (type.present) {
      final converter = $NoteOperationTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (dateOperation.present) {
      map['operation_date'] = Variable<DateTime>(dateOperation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteOperationCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('dateOperation: $dateOperation')
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
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "categories_operation_table" ("id")');
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'operation_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, category, amount, type, dateOperation];
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
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('operation_amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['operation_amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
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
      category: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
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

class BalanceCard extends DataClass implements Insertable<BalanceCard> {
  final String id;
  const BalanceCard({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    return map;
  }

  BalanceCardsCompanion toCompanion(bool nullToAbsent) {
    return BalanceCardsCompanion(
      id: Value(id),
    );
  }

  factory BalanceCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BalanceCard(
      id: serializer.fromJson<String>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
    };
  }

  BalanceCard copyWith({String? id}) => BalanceCard(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('BalanceCard(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is BalanceCard && other.id == this.id);
}

class BalanceCardsCompanion extends UpdateCompanion<BalanceCard> {
  final Value<String> id;
  const BalanceCardsCompanion({
    this.id = const Value.absent(),
  });
  BalanceCardsCompanion.insert({
    required String id,
  }) : id = Value(id);
  static Insertable<BalanceCard> custom({
    Expression<String>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  BalanceCardsCompanion copyWith({Value<String>? id}) {
    return BalanceCardsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalanceCardsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $BalanceCardsTable extends BalanceCards
    with TableInfo<$BalanceCardsTable, BalanceCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BalanceCardsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'balance_cards';
  @override
  String get actualTableName => 'balance_cards';
  @override
  VerificationContext validateIntegrity(Insertable<BalanceCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BalanceCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BalanceCard(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $BalanceCardsTable createAlias(String alias) {
    return $BalanceCardsTable(attachedDatabase, alias);
  }
}

class CurrencyData extends DataClass implements Insertable<CurrencyData> {
  final int id;
  final String name;
  final String code;
  final String symbol;
  final int type;
  const CurrencyData(
      {required this.id,
      required this.name,
      required this.code,
      required this.symbol,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    map['symbol'] = Variable<String>(symbol);
    map['type'] = Variable<int>(type);
    return map;
  }

  CurrencyCompanion toCompanion(bool nullToAbsent) {
    return CurrencyCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      symbol: Value(symbol),
      type: Value(type),
    );
  }

  factory CurrencyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      symbol: serializer.fromJson<String>(json['symbol']),
      type: serializer.fromJson<int>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'symbol': serializer.toJson<String>(symbol),
      'type': serializer.toJson<int>(type),
    };
  }

  CurrencyData copyWith(
          {int? id, String? name, String? code, String? symbol, int? type}) =>
      CurrencyData(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        symbol: symbol ?? this.symbol,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('symbol: $symbol, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, symbol, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyData &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.symbol == this.symbol &&
          other.type == this.type);
}

class CurrencyCompanion extends UpdateCompanion<CurrencyData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  final Value<String> symbol;
  final Value<int> type;
  const CurrencyCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.symbol = const Value.absent(),
    this.type = const Value.absent(),
  });
  CurrencyCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
    required String symbol,
    required int type,
  })  : name = Value(name),
        code = Value(code),
        symbol = Value(symbol),
        type = Value(type);
  static Insertable<CurrencyData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? symbol,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (symbol != null) 'symbol': symbol,
      if (type != null) 'type': type,
    });
  }

  CurrencyCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? code,
      Value<String>? symbol,
      Value<int>? type}) {
    return CurrencyCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      symbol: symbol ?? this.symbol,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('symbol: $symbol, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $CurrencyTable extends Currency
    with TableInfo<$CurrencyTable, CurrencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, code, symbol, type];
  @override
  String get aliasedName => _alias ?? 'currency';
  @override
  String get actualTableName => 'currency';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      symbol: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $CurrencyTable createAlias(String alias) {
    return $CurrencyTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CategoriesOperationTableTable categoriesOperationTable =
      $CategoriesOperationTableTable(this);
  late final $NoteOperationTable noteOperation = $NoteOperationTable(this);
  late final $BalanceCardsTable balanceCards = $BalanceCardsTable(this);
  late final $CurrencyTable currency = $CurrencyTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesOperationTable, noteOperation, balanceCards, currency];
}
