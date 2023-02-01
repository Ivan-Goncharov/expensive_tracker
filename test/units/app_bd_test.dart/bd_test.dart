import 'package:drift/native.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupGetIt();

  final db = AppDb(NativeDatabase.memory());

  tearDownAll(() async {
    db.close();
  });

  test('Test add new operation in db', () async {
    final model = ItemOperationModel.create(
      category: 1,
      amount: 230,
      type: OperationType.income,
      dateOperation: DateTime.now(),
      cardId: 'cardId',
    );
    await db.addNewOperationData(model.toInsertable());
    final data = await db.getNotesOperation(DateTime.now());
    expect(
      1,
      data.length,
    );
  });
}
