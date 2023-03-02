import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';

abstract class CreateBalanceCardService {
  Future<List<CurrencyData>> getCurrencyList();
}

class CreateBalanceCardServiceImpl implements CreateBalanceCardService {
  late final AppDb _db;
  CreateBalanceCardServiceImpl(StorageProvider storage) {
    _db = storage.database;
  }
  @override
  Future<List<CurrencyData>> getCurrencyList() {
    return _db.select(_db.currency).get();
  }
}
