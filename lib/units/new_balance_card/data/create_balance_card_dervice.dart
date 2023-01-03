import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class CreateBalanceCardService {
  Future<List<CurrencyData>> getCurrencyList();
}

class CreateBalanceCardServiceImpl implements CreateBalanceCardService {
  @override
  Future<List<CurrencyData>> getCurrencyList() {
    return database.select(database.currency).get();
  }
}
