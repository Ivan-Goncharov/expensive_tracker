import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:flutter/foundation.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  final BalanceCardRepo _balanceCardRepo;
  final CurrenciesRepo _currenciesRepo;

  CreateOperationCubit(
    this._balanceCardRepo,
    this._currenciesRepo,
  ) : super(CreateOperationInitial());
  double _amount = 0;
  int _category = -1;
  DateTime _dateTime = DateTime.now();
  OperationType _type = OperationType.expense;
  ItemBalanceCardModel? _balanceCardModel;
  CurrencyData? _currencyData;

  ItemBalanceCardModel get balanceCardModel => _balanceCardModel!;
  CurrencyData get currencyData => _currencyData!;

  Future<void> initial() async {
    emit(CreateOperationLoading());
    _balanceCardModel = _balanceCardRepo.currentBalanceCard;
    _currencyData =
        await _currenciesRepo.getCurrencyById(_balanceCardModel!.currencyId);

    emit(CreateOperationNotAllowed());
  }

  void changeAmount(double newValue) {
    _amount = newValue;
    _changeState();
  }

  void changeCategory(int newCategoryID) {
    _category = newCategoryID;

    _changeState();
  }

  void changeDateTime(DateTime newDate) {
    _dateTime = newDate;
  }

  void changeType(int typeIndex) {
    emit(CreateOperationNotAllowed());
    _category = -1;
    if (typeIndex == 0) {
      _type = OperationType.expense;
    } else {
      _type = OperationType.income;
    }
    _changeState();
  }

  Future<void> saveOperation() async {
    try {
      await getIt<CreateOperationRepository>().saveOperation(
        categoty: _category,
        dateTime: _dateTime,
        amount: _amount,
        type: _type,
        cardId: _balanceCardModel!.id,
      );
      emit(CreateOperationSucces());
    } catch (er, st) {
      debugPrint('Error while save card $er \n$st');
      emit(CreateOperationError());
    }
  }

  void _changeState() {
    if (_amount != 0 && _category != -1) {
      emit(CreateOperationAllowed());
    } else {
      emit(CreateOperationNotAllowed());
    }
  }
}
