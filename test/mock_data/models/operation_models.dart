import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

final operationModelFirst = ItemOperationModel.create(
  category: 1,
  amount: 230,
  type: OperationType.income,
  dateOperation: DateTime.now(),
  cardId: '12345678',
);

final operationModelSecond = ItemOperationModel.create(
  category: 0,
  amount: 200,
  type: OperationType.expense,
  dateOperation: DateTime.now(),
  cardId: '12345679',
);
