import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class CreateOperationRepository {
  Future<void> saveOperation(
    {
      required String categoty,
      required double amount,
      required OperationType type,
      required DateTime dateTime,
    }
  );
}
