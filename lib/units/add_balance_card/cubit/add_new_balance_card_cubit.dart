import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_state.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:flutter/material.dart';

/// Cubit для создания новой карты баланса.
class AddNewBalanceCardCubit extends Cubit<AddNewBalanceCardState> {
  final CurrenciesRepo _currRepo;
  final BalanceCardRepo _balanceRepo;
  AddNewBalanceCardCubit(
    this._currRepo,
    this._balanceRepo,
  ) : super(AddNewBalanceCardInitialState());

  // Название карты.
  var _nameOfCard = '';
  // Баланс
  double _balance = 0.0;
  // Валюта
  CurrencyData? _currencyData;
  // Видимость кнопки.
  var _isVisibleButton = false;
  StreamSubscription<CurrencyData>? _streamSubscription;

  /// При инициализации кубита - получаем валюты и подписываемся на стрим о выборе валюты.
  Future<void> initial() async {
    emit(AddNewBalanceCardLoadingState());
    await _currRepo.getSpecificTypeCurrencies();
    _streamSubscription =
        _currRepo.handleCurrencyData.listen(listenerCurrencies);
    emit(AddNewBalanceCardLoadedState(
      _isVisibleButton,
      currencyData: null,
    ));
  }

  /// Изменение имени карты.
  void changeInputName(String value) {
    if (value == _nameOfCard) return;
    _nameOfCard = value;
    _emitLoadedState();
  }

  /// Изменение баланса.
  void changeInputBalance(String value) {
    if (value.isEmpty) {
      _balance = 0.0;
      _emitLoadedState();
      return;
    }
    try {
      final newValue = double.parse(value);
      if (newValue == _balance) return;
      _balance = newValue;
      _emitLoadedState();
    } catch (er) {
      debugPrint(er.toString());
    }
  }

  /// Слушатель валют.
  /// Кидаем event об изменении.
  void listenerCurrencies(CurrencyData data) {
    if (data == _currencyData) return;
    _currencyData = data;
    emit(AddNewBalanceCardLoadedState(
      _isShowButton(),
      currencyData: _currencyData,
    ));
  }

  /// Метод для проверки - отличается ли видимость кнопки
  /// от той, что предполагается после изменения данных.
  /// Если да - кидаем event.
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

  /// Cохранение карты.
  Future<void> saveCard() async {
    await _balanceRepo.saveNewCard(
      name: _nameOfCard.trim(),
      amount: _balance,
      currencyId: _currencyData!.id,
    );
    emit(AddNewBalanceCardSucceful());
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
