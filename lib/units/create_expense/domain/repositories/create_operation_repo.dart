import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class CreateOperationRepository {
  Stream<ItemOperationModel> getNewOperation();
  Future<void> saveOperation({
    required int categoty,
    required double amount,
    required OperationType type,
    required DateTime dateTime,
    required String cardId,
  });
}
