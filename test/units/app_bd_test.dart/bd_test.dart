import 'package:drift/native.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
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

  /// Тестирование [addNewOperationData] и [getNotesOperation]
  test('Test add new operation in db', () async { 
    final data = await database.getNotesOperation(DateTime.now());
    expect(
      2,
      data.length,
    );
    expect(operationModelFirst.id, data.first.id);
  });
}
