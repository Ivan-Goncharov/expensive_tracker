import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/new_balance_card/data/create_balance_card_dervice.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';

class CreateBalanceCardRepoImpl implements CreateBalanceCardRepo {
  final CreateBalanceCardService _service;
  CreateBalanceCardRepoImpl(this._service);

  // ignore: unused_field
  String _name = '';
  final _listOfUsualCurrency = <CurrencyData>[];
  final _listOfCryptoCurrency = <CurrencyData>[];

  @override
  List<CurrencyData> get listOfUsualCurrency => _listOfUsualCurrency;
  @override
  List<CurrencyData> get listOfCryptoCurrency => _listOfCryptoCurrency;

  @override
  void changeName(String name) => _name = name;

  @override
  Future<void> getCurrencyList() async {
    final list = await _service.getCurrencyList();
    for (final item in list) {
      if (item.type == 0) {
        _listOfUsualCurrency.add(item);
      } else {
        _listOfCryptoCurrency.add(item);
      }
    }
  }
}
