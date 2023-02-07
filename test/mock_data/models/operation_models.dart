import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

final dateFirst = DateTime(
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

final mockQuantityCategories = 20;

final operationModelFirst = ItemOperationModel.create(
  category: 1,
  amount: 230,
  type: OperationType.income,
  dateOperation: dateFirst,
  cardId: '12345678',
);

final operationModelSecond = ItemOperationModel.create(
  category: 0,
  amount: 200,
  type: OperationType.expense,
  dateOperation: dateSecond,
  cardId: '12345679',
);
