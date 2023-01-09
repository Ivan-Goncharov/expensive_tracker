import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class CurrenciesRepo {
  /// Получение валюты по id;
  /// [id] - id валюты.
  Future<CurrencyData> getCurrencyById(int id);

  /// Запрос на получение валют.
  Future<void> getSpecificTypeCurrencies();

  /// Stream с изменениями по выбранной валюте.
  Stream<CurrencyData> get handleCurrencyData;

  /// Метод для выбора валюты в поиске.
  /// Отправляет выбранную валюту в стрим.
  /// [data] - выбранная валюты.
  void changeCurrencyData(CurrencyData data);

  /// Cписок обычных валют.
  List<CurrencyData> get listUsualCurrencies;

  /// Cписок крипто валюты.
  List<CurrencyData> get listCryptoCurrencies;

  void dispose();
}
