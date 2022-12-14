import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class CreateBalanceCardRepo {
  void changeName(String name);

  List<CurrencyData> get listOfUsualCurrency;
  List<CurrencyData> get listOfCryptoCurrency;

  CurrencyData get currentCurrencyData;

  Future<void> getCurrencyList();

  Stream<CurrencyData> get handleCurrencyData;

  void changeCurrencyData(CurrencyData data);

  Future<void> saveInputAmount(double value);
}
