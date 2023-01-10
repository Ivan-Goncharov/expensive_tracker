import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_state.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:flutter/material.dart';

class AddNewBalanceCardCubit extends Cubit<AddNewBalanceCardState> {
  final CurrenciesRepo _currRepo;
  AddNewBalanceCardCubit(this._currRepo)
      : super(AddNewBalanceCardInitialState());
  var _nameOfCard = '';
  double _balance = 0.0;
  CurrencyData? _currencyData;
  var _isVisibleButton = false;
  StreamSubscription<CurrencyData>? _streamSubscription;

  Future<void> initial() async {
    emit(AddNewBalanceCardLoadingState());
    await _currRepo.getSpecificTypeCurrencies();
    _streamSubscription =
        _currRepo.handleCurrencyData.listen(_listenerCurrencies);
    emit(AddNewBalanceCardLoadedState(
      _isVisibleButton,
    ));
  }

  void changeInputName(String value) {
    if (value == _nameOfCard) return;
    _nameOfCard = value;
    _emitLoadedState();
  }

  void changeInputBalance(String value) {
    try {
      final newValue = double.parse(value);
      if (newValue == _balance) return;
      _balance = newValue;
      _emitLoadedState();
    } catch (er) {
      debugPrint(er.toString());
    }
  }

  void _listenerCurrencies(CurrencyData data) {
    if (data == _currencyData) return;
    _currencyData = data;
    emit(AddNewBalanceCardLoadedState(
      _isVisibleButton,
      currencyData: _currencyData,
    ));
  }

  void _emitLoadedState() {
    final flag = _isShowButton();
    if (flag != _isVisibleButton) {
      _isVisibleButton = flag;
      emit(AddNewBalanceCardLoadedState(
        _isVisibleButton,
        currencyData: _currencyData,
      ));
    }
  }

  bool _isShowButton() =>
      _currencyData != null && _balance != 0.0 && _nameOfCard.trim().isNotEmpty;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    _currRepo.dispose();
    return super.close();
  }
}
