import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/services/create_operation_service.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';

class CreateOperationRepoImpl implements CreateOperationRepository {
  final CreateOpeartionService createOpeartionService;
  CreateOperationRepoImpl(this.createOpeartionService);

  @override
  Future<void> saveOperation({
    required String categoty,
    required double amount,
    required OperationType type,
    required DateTime dateTime,
  }) async {
    final operation = ItemOperationModel.create(
      category: categoty,
      amount: amount,
      type: type,
      dateOperation: dateTime,
    );
    await createOpeartionService.createOperation(operation);
  }
}
