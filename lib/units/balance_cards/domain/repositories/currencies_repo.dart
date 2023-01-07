import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class CurrenciesRepo {
  /// Получение валюты по id;
  /// [id] - id валюты.
  Future<CurrencyData> getCurrencyById(int id);

  /// Запрос на получение валют.
  /// [type] - тип валюты, которую необходимо получить.
  Future<void> getSpecificTypeCurrencies(int type);
}
