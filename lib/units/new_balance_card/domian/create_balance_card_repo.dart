import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class CreateBalanceCardRepo {
  /// Метод для изменения имени карты.
  /// [name] - введенное имя.
  void changeName(String name);

  /// Сохранение ввода баланаса.
  /// [value] - баланс.
  Future<void> saveCardBalance(double value);

  /// Сохранение выбранной валюты.
  /// [data] - валюта, выбранная в поиске.
  void selectCurrencyData(CurrencyData data);

  /// Текущая валюта, которую выбрал пользователь.
  CurrencyData get currentCurrencyData;
}
