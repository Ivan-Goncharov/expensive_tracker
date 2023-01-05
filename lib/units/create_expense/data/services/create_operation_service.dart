import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class CreateOpeartionService {
  Future<void> createOperation(ItemOperationModel operation);
}

class CreateOpeartionServiceImpl implements CreateOpeartionService {
  @override
  Future<void> createOperation(ItemOperationModel operation) async {
    await database.addNewOperationData(operation.toInsertable());
    await database.updateBalanceCardAmount(operation);
  }
}
