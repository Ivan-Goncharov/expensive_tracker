import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../init_global.dart';
import '../../mock_data/models/operation_models.dart';

void main() {
  setupTests();

  setUpAll(() async {
    final listOperationes = [operationModelFirst, operationModelSecond];
    for (final itemOper in listOperationes) {
      await database.addNewOperationData(itemOper.toInsertable());
    }
  });

  ///---Note operations---

  /// Тестирование [addNewOperationData] и [getNotesOperation]
  test('Test add new operation in db', () async {
    final data = await database.getNotesOperation(DateTime.now());
    expect(
      2,
      data.length,
    );
    expect(operationModelFirst.id, data.first.id);
  });

  /// Тестирование [getTimeSingleOperation] и поиск самой старшей записи
  test('Test get last date operation', () async {
    final data = await database.getTimeSingleOperation(OrderingMode.desc);
    expect(data, dateFirst);
  });

  /// Тестирование [getTimeSingleOperation] и поиск самой младшей записи
  test('Test get first date operation', () async {
    final data = await database.getTimeSingleOperation(OrderingMode.asc);
    expect(data, dateSecond);
  });

  /// Тестирование [getItemNoteOperation] - получение одной операции.
  test('Test get item notesOperation', () async {
    final data = await database.getItemNoteOperation(operationModelFirst.id);
    expect(data, operationModelFirst);
  });

  /// Тестирование [deleteNoteData] - удаление записи из бд
  test('Test delete note operation', () async {
    await database.deleteNoteData(operationModelFirst.id);
    final data = await database.getNotesOperation(DateTime.now());
    expect(data, [operationModelSecond]);
  });

  /// Тестирование [updateNoteData] - обновление одной записи в бд.
  test('Test update noteOperation', () async {
    final newValue = operationModelSecond.copyWith(category: 3);
    await database.updateNoteData(
        operationModelSecond.id, newValue.toInsertable());
    final data = await database.getItemNoteOperation(operationModelSecond.id);
    expect(data, newValue);
  });

  /// --- Categories---
  
  /// Тестирование [getAllCategories] - получение всех категорий
  // test('Test get all categories', () async {
  //   final data = await database.getAllCategories();
  //   expect(data.length, 20);
  //   expect(data.first.title, 'Food');
  // });
}
