import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:rxdart/rxdart.dart';

/// Репозиторий для получения списков валюты из БД.
class CurrenciesRepoImpl implements CurrenciesRepo {
  final BalanceCardsService _service;
  CurrenciesRepoImpl(this._service);

  final _streamController = PublishSubject<CurrencyData>();

  /// Мапа с полученными валютами из бд
  final _mapOfCurrencies = HashMap<int, CurrencyData>();

  List<CurrencyData> _listUsualCurrencies = [];
  List<CurrencyData> _listCryptoCurrencies = [];

  @override
  Stream<CurrencyData> get handleCurrencyData => _streamController.stream;
  @override
  List<CurrencyData> get listUsualCurrencies => _listUsualCurrencies;
  @override
  List<CurrencyData> get listCryptoCurrencies => _listCryptoCurrencies;

  @override
  Future<CurrencyData> getCurrencyById(int id) async {
    if (_mapOfCurrencies.containsKey(id)) {
      return _mapOfCurrencies[id]!;
    } else {
      final currency = await _service.getItemCurrencyData(id);
      _mapOfCurrencies[id] = currency;
      return currency;
    }
  }

  @override
  void changeCurrencyData(CurrencyData data) {
    _streamController.add(data);
  }

  @override
  Future<void> getSpecificTypeCurrencies() async { 
    _listUsualCurrencies = await _service.getSpecificTypeCurrencies(0);
    _listCryptoCurrencies = await _service.getSpecificTypeCurrencies(1); 
  }

  @override
  void dispose() {
    _listCryptoCurrencies.clear();
    _listUsualCurrencies.clear();
  }
}
