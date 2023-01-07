import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';

/// Репозиторий для получения списков валюты из БД.
class CurrenciesRepoImpl implements CurrenciesRepo {
  final BalanceCardsService _service;
  CurrenciesRepoImpl(this._service);

  /// Мапа с полученными валютами из бд
  final _mapOfCurrencies = HashMap<int, CurrencyData>();

  @override
  Future<CurrencyData> getCurrencyById(int id) async {
    if (_mapOfCurrencies.containsKey(id)) {
      return _mapOfCurrencies[id]!;
    } else {
      return _service.getItemCurrencyData(id);
    }
  }

  @override
  Future<void> getSpecificTypeCurrencies(int type) {
    return _service.getSpecificTypeCurrencies(type);
  }
}
