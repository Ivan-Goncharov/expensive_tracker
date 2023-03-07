import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class LastOperationesSevices {
  Future<List<ItemOperationModel>> getLastOperationes(DateTime date, String cardId);
}

class LastOperationesServicesImpl implements LastOperationesSevices {
  late final AppDb _db;
  LastOperationesServicesImpl(StorageProvider storage) {
    _db = storage.database;
  }
  @override
  Future<List<ItemOperationModel>> getLastOperationes(DateTime date, String cardId)   {
    return _db.getNotesOperation(date, cardId);
  }
}
