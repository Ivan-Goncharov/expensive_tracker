import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

final mockDateFirst = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
  DateTime.now().hour,
  DateTime.now().minute,
  DateTime.now().second,
);
final dateSecond = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
  DateTime.now().hour,
  DateTime.now().minute,
  DateTime.now().second,
);

final mockOperationModelFirst = ItemOperationModel.create(
  category: 1,
  amount: 230,
  type: OperationType.income,
  dateOperation: mockDateFirst,
  cardId: '12345678',
);

final mockOperationModelSecond = ItemOperationModel.create(
  category: 0,
  amount: 200,
  type: OperationType.expense,
  dateOperation: dateSecond,
  cardId: '12345679',
);

ItemOperationModel getMockOperationModelThird(String cardId) =>
    ItemOperationModel.create(
      category: 4,
      amount: 250,
      type: OperationType.expense,
      dateOperation: dateSecond,
      cardId: cardId,
    );
