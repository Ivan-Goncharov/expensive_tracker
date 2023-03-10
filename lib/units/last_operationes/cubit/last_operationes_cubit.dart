import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';

import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:flutter/material.dart';

class LastOperationesCubit extends Cubit<LastOperationState> {
  final LastOperationesRepo _lastOperationRepo;
  final MonthRepositoty _monthRepositoty;
  final CreateOperationRepository _createOperRepo;
  final BalanceCardRepo _balanceCardRepo;
  final CurrenciesRepo _currenciesRepo;

  LastOperationesCubit(
    this._lastOperationRepo,
    this._monthRepositoty,
    this._createOperRepo,
    this._balanceCardRepo,
    this._currenciesRepo,
  ) : super(LastOperationInitial());

  late DateTime _currentDate;
  ItemBalanceCardModel? _currentCard;
  CurrencyData? _currencyData;

  Future<void> initial() async {
    _monthRepositoty.getMonth().listen(_listenerMonth);
    _createOperRepo.getNewOperation().listen(_listenerNewOperation);
    _balanceCardRepo.cardIdStream().listen(_listenCardsScroll);
    _currentCard = _balanceCardRepo.currentBalanceCard;
    await _getCurrencyById(_currentCard!.currencyId);

    _currentDate = DateTime.now();
    await _getItemMonthOperationes();
  }

  Future<void> _getCurrencyById(int id) async {
    _currencyData = await _currenciesRepo.getCurrencyById(id);
  }

  Future<void> _listenerMonth(int event) async {
    _currentDate = _monthRepositoty.listOfMonth[event];
    await _getItemMonthOperationes();
  }

  void _listenerNewOperation(ItemOperationModel model) {
    final isAdded = _lastOperationRepo.addNewOperationes(model);
    if (isAdded) {
      emit(LastOperationLoadingState());
      final list = _lastOperationRepo.operationes;
      emit(LastOperationLoadedState(list, _currencyData!));
    }
  }

  void _listenCardsScroll(ItemBalanceCardModel? currentCard) async {
    emit(LastOperationLoadingState());
    _currentCard = currentCard;
    _currentDate = DateTime.now();
    await _getCurrencyById(_currentCard!.currencyId);
    await _getItemMonthOperationes();
  }

  Future<void> _getItemMonthOperationes() async {
    emit(LastOperationLoadingState());
    try {
      final list = await _lastOperationRepo.getLastOperationes(
          _currentDate, _currentCard!.id);
      if (list.isEmpty) {
        emit(LastOperationEmptyState());
      } else {
        emit(LastOperationLoadedState(list, _currencyData!));
      }
    } catch (er, st) {
      debugPrint('$er\n$st');
      emit(LastOperationErrorState());
    }
  }

  CategoriesOperationTableData getCategoriesById(int id) =>
      _lastOperationRepo.getCategoryById(id);
}
