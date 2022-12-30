import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expensive_tracker_app/data/entity/categories.dart';
import 'package:expensive_tracker_app/data/entity/note_operation.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

late AppDb database;

void initDb() {
  database = AppDb();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'note_operation.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [NoteOperation, CategoriesOperationTable])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Получение списка всех записей.
  Future<List<ItemOperationModel>> getNotesOperation() {
    return select(noteOperation).get();
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
  Future<bool> updateNoteData(Insertable<ItemOperationModel> operation) {
    return update(noteOperation).replace(operation);
  }

  /// Сохранение одной записи в БД.
  Future<int> addNewOperationData(Insertable<ItemOperationModel> operation) {
    return into(noteOperation).insert(operation);
  }

  /// Получение списка всех записей.
  Future<List<OperationCategories>> getCategories() {
    return select(categoriesOperationTable).get();
  }

  /// Сохранение  категории
  Future<int> addNewCategory(Insertable<OperationCategories> category) {
    return into(categoriesOperationTable).insert(category);
  }

  /// Получение всех категорий
  Future<List<OperationCategories>> getAllCategories() {
    return select(categoriesOperationTable).get();
  }

  /// Удаление категории
  Future<int> deleteCategories(String id) {
    return (delete(categoriesOperationTable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
