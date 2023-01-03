import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/new_balance_card/data/create_balance_card_dervice.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';

class CreateBalanceCardRepoImpl implements CreateBalanceCardRepo {
  final CreateBalanceCardService _service;
  CreateBalanceCardRepoImpl(this._service);

  // ignore: unused_field
  String _name = '';
  CurrencyData? _currentCurrencyData;

  final _listOfUsualCurrency = <CurrencyData>[];
  final _listOfCryptoCurrency = <CurrencyData>[];

  @override
  List<CurrencyData> get listOfUsualCurrency => _listOfUsualCurrency;
  @override
  List<CurrencyData> get listOfCryptoCurrency => _listOfCryptoCurrency;
  @override
  CurrencyData get currentCurrencyData =>
      _currentCurrencyData ?? _listOfUsualCurrency.first;

  @override
  void changeName(String name) => _name = name;

  @override
  Future<void> getCurrencyList() async {
    final list = await _service.getCurrencyList();
    for (final item in list) {
      if (item.type == 0) {
        if (item.code == 'USD') _currentCurrencyData = item;
        _listOfUsualCurrency.add(item);
      } else {
        _listOfCryptoCurrency.add(item);
      }
    }
    _currentCurrencyData ??= _listOfUsualCurrency.first;
  }
}
