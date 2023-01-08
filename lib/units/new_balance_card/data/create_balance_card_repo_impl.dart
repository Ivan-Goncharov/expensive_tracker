import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/data/create_balance_card_dervice.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:rxdart/rxdart.dart';

class CreateBalanceCardRepoImpl implements CreateBalanceCardRepo {
  final CreateBalanceCardService _service;
  CreateBalanceCardRepoImpl(this._service);

  String _name = '';
  CurrencyData? _currentCurrencyData;

  @override
  CurrencyData get currentCurrencyData => _currentCurrencyData!;

  @override
  @override
  void changeName(String name) => _name = name;

  @override
  void selectCurrencyData(CurrencyData data) {
    _currentCurrencyData = data;
  }

  @override
  Future<void> saveInputAmount(double value) {
    return getIt<BalanceCardRepo>().saveNewCard(
      name: _name,
      amount: value,
      currencyId: _currentCurrencyData!.id,
    );
  }
   
}
