import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCurrencyCubit extends Cubit<SearchCurrencyState> {
  final CurrenciesRepo _currenciesRepo;

  SearchCurrencyCubit(this._currenciesRepo)
      : super(SearchCurrencyInitialState());
  late TextEditingController _controller;
  var _listOfCashCurrency = <CurrencyData>[];
  var _listOfCryptoCurrency = <CurrencyData>[];
  var _selectedToogle = 0;

  void initial() {
    _controller = TextEditingController()..addListener(_textListener);
    _addAllCurrency();
    emit(
      SearchCurrencyChangeState(
        selectToogleIndex: _selectedToogle,
        textController: _controller,
        listOfCurrency: _listOfCashCurrency,
      ),
    );
  }

  void _addAllCurrency() {
    _listOfCashCurrency = _currenciesRepo.listUsualCurrencies;
    _listOfCryptoCurrency = _currenciesRepo.listCryptoCurrencies;
  }

  void changeToogleSwitch(int value) {
    _addAllCurrency();
    _controller.clear();
    _selectedToogle = value;
    emit(
      SearchCurrencyChangeState(
        selectToogleIndex: _selectedToogle,
        textController: _controller,
        listOfCurrency:
            _selectedToogle == 0 ? _listOfCashCurrency : _listOfCryptoCurrency,
      ),
    );
  }

  void _textListener() {
    final query = _controller.text.toLowerCase();

    if (query.isEmpty) {
      _addAllCurrency();
    } else if (_selectedToogle == 0) {
      _listOfCashCurrency = _searchCurrency(
        _controller.text.toLowerCase(),
        _currenciesRepo.listUsualCurrencies,
      );
    } else {
      _listOfCryptoCurrency = _searchCurrency(
        _controller.text.toLowerCase(),
        _currenciesRepo.listCryptoCurrencies,
      );
    }
    emit(
      SearchCurrencyChangeState(
        selectToogleIndex: _selectedToogle,
        textController: _controller,
        listOfCurrency:
            _selectedToogle == 0 ? _listOfCashCurrency : _listOfCryptoCurrency,
      ),
    );
  }

  List<CurrencyData> _searchCurrency(
    String query,
    List<CurrencyData> initalList,
  ) {
    return initalList
        .where((c) =>
            c.name.toLowerCase().contains(query) ||
            c.code.toLowerCase().contains(query))
        .toList();
  }

  void selectCurrencyData(CurrencyData data) {
    _currenciesRepo.changeCurrencyData(data);
    emit(SearchCurrencySelectState());
  }
}
