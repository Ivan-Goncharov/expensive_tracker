import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class CreateOpeartionService {
  Future<void> createOperation(ItemOperationModel operation);
}

class CreateOpeartionServiceImpl implements CreateOpeartionService {
  late final AppDb _db;
  CreateOpeartionServiceImpl(StorageProvider storage) {
    _db = storage.database;
  }
  @override
  Future<void> createOperation(ItemOperationModel operation) async {
    await _db.addNewOperationData(operation.toInsertable());
    await _db.updateBalanceCardAmount(operation);
  }
}
