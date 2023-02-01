import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';

class CreateBalanceCardRepoImpl implements CreateBalanceCardRepo {
  CreateBalanceCardRepoImpl();

  String _name = '';
  CurrencyData? _currentCurrencyData;

  @override
  CurrencyData get currentCurrencyData {
    if (_currentCurrencyData == null) {
      _currentCurrencyData = getIt<CurrenciesRepo>().listUsualCurrencies.first;
      return _currentCurrencyData!;
    } else {
      return _currentCurrencyData!;
    }
  }

  @override
  @override
  void changeName(String name) => _name = name;

  @override
  void selectCurrencyData(CurrencyData data) {
    _currentCurrencyData = data;
  }

  @override
  Future<void> saveCardBalance(double value) {
    return getIt<BalanceCardRepo>().saveNewCard(
      name: _name,
      amount: value,
      currencyId: _currentCurrencyData!.id,
    );
  }
}
