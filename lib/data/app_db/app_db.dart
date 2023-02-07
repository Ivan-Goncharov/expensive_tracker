import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expensive_tracker_app/data/entity/balance_cards.dart';
import 'package:expensive_tracker_app/data/entity/categories.dart';
import 'package:expensive_tracker_app/data/entity/currency.dart';
import 'package:expensive_tracker_app/data/entity/note_operation.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

late AppDb database;

void initDb() {
  print('DEBUG INIT DB');
  database = AppDb();
}

Future<void> deleteBdFromDisk() async {
  final dbPath = await _getDataBasePath();
  final file = File(dbPath);
  if (file.existsSync()) {
    await database.close();
    file.deleteSync();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async { 
    final dbPath = await _getDataBasePath();
    final file = File(dbPath)..createSync(recursive: true); 
    final blob = await rootBundle.load('assets/my_db.db'); 
    final buffer = blob.buffer;
    await file.writeAsBytes(
        buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes)); 
    return NativeDatabase(file);
  });
}

Future<String> _getDataBasePath() async {
  final documents = await getApplicationDocumentsDirectory();
  return path.join(documents.path, 'app.db');
}

@DriftDatabase(
    tables: [NoteOperation, CategoriesOperationTable, BalanceCards, Currency])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Получение списка всех записей.
  Future<List<ItemOperationModel>> getNotesOperation(DateTime date) {
    return (select(noteOperation)
          ..where((tbl) =>
              tbl.dateOperation.year.equals(date.year) &
              tbl.dateOperation.month.equals(date.month))
          ..orderBy([
            (u) => OrderingTerm(
                expression: u.dateOperation, mode: OrderingMode.desc)
          ]))
        .get();
  }

  /// Получение даты самого первой и самого последнего месяца
  Future<DateTime> getTimeSingleOperation(OrderingMode mode) async {
    final data = await (select(noteOperation)
          ..orderBy(
              [(u) => OrderingTerm(expression: u.dateOperation, mode: mode)])
          ..limit(1))
        .get();

    return data.first.dateOperation;
  }

  /// Получение одной записи.
  Future<ItemOperationModel> getItemNoteOperation(String id) {
    return (select(noteOperation)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Удаление одной записи из бд.
  Future<int> deleteNoteData(String id) {
    return (delete(noteOperation)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Обновление одной записи в бд.
  Future<void> updateNoteData(
      String id, Insertable<ItemOperationModel> operation) async {
    await (delete(noteOperation)..where((tbl) => tbl.id.equals(id))).go();
    await into(noteOperation).insert(operation);
  }

  /// Сохранение одной записи в БД.
  Future<int> addNewOperationData(
      Insertable<ItemOperationModel> operation) async { 
    return into(noteOperation).insert(operation);
  }

  /// Получение всех категорий
  Future<List<CategoriesOperationTableData>> getAllCategories() {
    return select(categoriesOperationTable).get();
  }

  /// Запись одного id карты баланса
  Future<int> addNewBalanceCard(Insertable<ItemBalanceCardModel> card) {
    return into(balanceCards).insert(card);
  }

  /// Получение всех id карт балансов
  Future<List<ItemBalanceCardModel>> getAllBalanceCards() {
    return (select(balanceCards)).get();
  }

  /// Обновление баланса одной карты
  /// [model] - денежная операция после которой потребовалось обновление баланаса.
  Future<void> updateBalanceCardAmount(ItemOperationModel model) async {
    var balanceCard = await (select(balanceCards)
          ..where((tbl) => tbl.id.equals(model.cardId)))
        .getSingle();

    if (model.type == OperationType.income) {
      balanceCard =
          balanceCard.copyWith(amount: balanceCard.amount + model.amount);
    } else {
      balanceCard =
          balanceCard.copyWith(amount: balanceCard.amount - model.amount);
    }
    await (update(balanceCards)..where((t) => t.id.equals(model.cardId)))
        .write(balanceCard.toInsertable());
  }

  /// Получение одной карты баланса.
  /// [id] - id данной карты.
  Future<ItemBalanceCardModel> getItemBalanceCard(String id) {
    return (select(balanceCards)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .getSingle();
  }

  /// Получение валюты по id;
  /// [id] - id валюты.
  Future<CurrencyData> getItemCurrencyData(int id) {
    return (select(currency)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  /// Получение всех валют.
  /// [type] - тип валюты
  Future<List<CurrencyData>> getSpecificTypeCurrencies(int type) async {
    return (select(currency)
          ..where((tbl) => tbl.type.equals(type))
          ..orderBy([(c) => OrderingTerm.asc(c.name)]))
        .get();
  }

  // Future<void> exportInto(File file) async {
  //   // Make sure the directory of the target file exists
  //   await file.parent.create(recursive: true);

  //   // Override an existing backup, sqlite expects the target file to be empty
  //   if (file.existsSync()) {
  //     file.deleteSync();
  //   }

  //   await customStatement('VACUUM INTO ?', [file.path]);
  // }

  /// Удаление категории
  // Future<int> deleteCategories(int id) {
  //   return (delete(categoriesOperationTable)..where((tbl) => tbl.id.equals(id)))
  //       .go();
  // }
  /// Сохранение  категории
  // Future<int> addNewCategory(
  //     Insertable<CategoriesOperationTableData> category) {
  //   return into(categoriesOperationTable).insert(category);
  // }
}
