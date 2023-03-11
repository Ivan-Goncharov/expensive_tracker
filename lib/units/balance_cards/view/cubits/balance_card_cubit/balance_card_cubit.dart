import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_state.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:flutter/material.dart';

class BalanceCardCubit extends Cubit<BalanceCardState> {
  final BalanceCardRepo _balanceRepo;
  final CreateOperationRepository _createOpRepo;
  final MonthRepositoty _monthRepositoty;
  final CurrenciesRepo _currenciesRepo;
  BalanceCardCubit(
    this._balanceRepo,
    this._createOpRepo,
    this._monthRepositoty,
    this._currenciesRepo,
  ) : super(BalanceCardInitialState());

  late CurrencyData _currencyData;
  late ItemBalanceCardModel _balanceCardModel;
  late MonthOperationAmountModel _monthOperationAmountModel;

  Future<void> initial(ItemBalanceCardModel balanceCard) async {
    try {
      _balanceCardModel = balanceCard;
      _createOpRepo.getNewOperation().listen(_listenerCreateOperation);
      _monthRepositoty.getMonth().listen(_listenerMonth);

      _currencyData =
          await _currenciesRepo.getCurrencyById(_balanceCardModel.currencyId);
      _monthOperationAmountModel = await _balanceRepo.getOperationesMonthSumm(
          DateTime.now(), _balanceCardModel.id);

      emit(BalanceCardLoadedState(
        currencyData: _currencyData,
        balanceCardModel: _balanceCardModel,
        monthOperationAmount: _monthOperationAmountModel,
      ));
    } catch (er, st) {
      debugPrint('$er\n$st');
      emit(BalanceCardErrorState());
    }
  }

  Future<void> _listenerMonth(int event) async {
    if (isClosed) return;
    final date = _monthRepositoty.listOfMonth[event];
    _monthOperationAmountModel =
        await _balanceRepo.getOperationesMonthSumm(date, _balanceCardModel.id);

    emit(BalanceCardLoadedState(
      currencyData: _currencyData,
      balanceCardModel: _balanceCardModel,
      monthOperationAmount: _monthOperationAmountModel,
    ));
  }

  Future<void> _listenerCreateOperation(ItemOperationModel model) async {
    if (isClosed || model.cardId != _balanceCardModel.id) {
      return;
    }
    _balanceCardModel = _balanceRepo.listOfCards
        .firstWhere((card) => card.id == _balanceCardModel.id);
    _changeMonthAmountModel(model);

    emit(BalanceCardLoadedState(
      balanceCardModel: _balanceCardModel,
      currencyData: _currencyData,
      monthOperationAmount: _monthOperationAmountModel,
    ));
  }

  void _changeMonthAmountModel(ItemOperationModel operation) {
    if (_monthOperationAmountModel.isSameDate(operation.dateOperation)) {
      _monthOperationAmountModel = _monthOperationAmountModel.changeValue(
        isIncome: operation.type == OperationType.income,
        value: operation.amount,
      );
    }
  }
}
