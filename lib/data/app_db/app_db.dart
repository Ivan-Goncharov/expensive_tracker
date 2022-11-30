import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expensive_tracker_app/data/entity/note_operation.dart';
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

@DriftDatabase(tables: [NoteOperation])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Получение списка всех записей.
  Future<List<NoteOperationData>> getNotesOperation() {
    return select(noteOperation).get();
  }

  /// Получение одной записи.
  Future<NoteOperationData> getItemNoteOperation(int id) {
    return (select(noteOperation)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Удаление одной записи из бд.
  Future<int> deleteNoteData(int id) {
    return (delete(noteOperation)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Обновление одной записи в бд.
  Future<bool> updateNoteData(NoteOperationData noteData) {
    return update(noteOperation).replace(noteData);
  }

  /// Сохранение одной записи в БД.
  Future<int> addNewOperationData(NoteOperationData noteData) {
    return into(noteOperation).insert(noteData);
  }
}
