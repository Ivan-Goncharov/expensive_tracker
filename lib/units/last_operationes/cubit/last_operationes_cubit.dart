import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
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
  LastOperationesCubit(
    this._lastOperationRepo,
    this._monthRepositoty,
    this._createOperRepo,
    this._balanceCardRepo,
  ) : super(LastOperationInitial());
  late DateTime _currentDate;
  String? _currentCardID;

  Future<void> initial() async {
    _monthRepositoty.getMonth().listen(_listenerMonth);
    _createOperRepo.getNewOperation().listen(_listenerNewOperation);
    _balanceCardRepo.cardIdStream().listen(_listenCardsScroll);
    _currentCardID = _balanceCardRepo.currentBalanceCard.id;

    _currentDate = DateTime.now();
    await _getItemMonthOperationes();
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
      emit(LastOperationLoadedState(list));
    }
  }

  void _listenCardsScroll(String id) {
    print('DEBUG EMIT SCROLL');
    emit(LastOperationLoadingState());
    _currentCardID = id;
    _currentDate = DateTime.now();
    _getItemMonthOperationes();
  }

  Future<void> _getItemMonthOperationes() async {
    emit(LastOperationLoadingState());
    try {
      final list = await _lastOperationRepo.getLastOperationes(
          _currentDate, _currentCardID!);
      if (list.isEmpty) {
        emit(LastOperationErrorState());
      } else {
        emit(LastOperationLoadedState(list));
      }
    } catch (er, st) {
      debugPrint('$er\n$st');
      emit(LastOperationErrorState());
    }
  }

  CategoriesOperationTableData getCategoriesById(int id) {
    return _lastOperationRepo.getCategoryById(id);
  }
}
