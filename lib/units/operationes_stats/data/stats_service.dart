import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class StatsService {
  Future<List<ItemOperationModel>> getAllOperations(String cardId);
}

class StatsServiceImpl implements StatsService {
  late final AppDb _db;
  StatsServiceImpl(StorageProvider provider) {
    _db = provider.database;
  }

  @override
  Future<List<ItemOperationModel>> getAllOperations(String cardId) {
    return _db.getAllNotesOperation(cardId);
  }
}
