import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../init_global.dart';
import '../../mock_data/models/balance_card_models.dart';
import '../../mock_data/models/operation_models.dart';

void main() {
  setupTests();

  setUpAll(() async {
    final listOperationes = [mockOperationModelFirst, mockOperationModelSecond];
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
    expect(mockOperationModelFirst.id, data.first.id);
  });

  /// Тестирование [getTimeSingleOperation] и поиск самой старшей записи
  test('Test get last date operation', () async {
    final data = await database.getTimeSingleOperation(OrderingMode.desc);
    expect(data, mockDateFirst);
  });

  /// Тестирование [getTimeSingleOperation] и поиск самой младшей записи
  test('Test get first date operation', () async {
    final data = await database.getTimeSingleOperation(OrderingMode.asc);
    expect(data, dateSecond);
  });

  /// Тестирование [getItemNoteOperation] - получение одной операции.
  test('Test get item notesOperation', () async {
    final data =
        await database.getItemNoteOperation(mockOperationModelFirst.id);
    expect(data, mockOperationModelFirst);
  });

  /// Тестирование [deleteNoteData] - удаление записи из бд
  test('Test delete note operation', () async {
    await database.deleteNoteData(mockOperationModelFirst.id);
    final data = await database.getNotesOperation(DateTime.now());
    expect(data, [mockOperationModelSecond]);
  });

  /// Тестирование [updateNoteData] - обновление одной записи в бд.
  test('Test update noteOperation', () async {
    final newValue = mockOperationModelSecond.copyWith(category: 3);
    await database.updateNoteData(
        mockOperationModelSecond.id, newValue.toInsertable());
    final data =
        await database.getItemNoteOperation(mockOperationModelSecond.id);
    expect(data, newValue);
  });

  /// --- Categories---

  /// Тестирование [getAllCategories] - получение всех категорий
  test('Test get all categories', () async {
    final data = await database.getAllCategories();
    expect(data.length, 20);
    expect(data.first.title, 'Food');
  });

  /// --- Balance cards ---

  test('Test add balance card model in bd', () async {
    await database.addNewBalanceCard(mockBalanceModel.toInsertable());
    final data = await database.getItemBalanceCard(mockBalanceModel.id);
    expect(data, mockBalanceModel);
  });

  test('Test get all balance cards from bd', () async {
    await database.addNewBalanceCard(mockBalanceModelSecond.toInsertable());
    final data = await database.getAllBalanceCards();
    expect(data.length, 2);
    expect(data[1].id, mockBalanceModelSecond.id);
  });

  test('Test update balance card in bd', () async {
    final operation = getMockOperationModelThird(mockBalanceModelSecond.id);
    await database.updateBalanceCardAmount(operation);
    final data = await database.getItemBalanceCard(mockBalanceModelSecond.id);
    expect(data.amount, mockInitialBalanceSecond - operation.amount);
  });

  /// --- Currencies ---
  test('Test get item currency', () async {
    final data = await database.getItemCurrencyData(1);
    expect(data.code, 'USD');
  });

  test('Test get all currencies', () async {
    final data = await database.getSpecificTypeCurrencies(0);
    expect(data.length, 119); 
  });
}
