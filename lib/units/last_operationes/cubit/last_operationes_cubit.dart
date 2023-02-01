import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';

import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:flutter/material.dart';

class LastOperationesCubit extends Cubit<LastOperationState> {
  final LastOperationesRepo lastOperationRepo;
  final MonthRepositoty monthRepositoty;
  final CreateOperationRepository createOperRepo;
  LastOperationesCubit(
      this.lastOperationRepo, this.monthRepositoty, this.createOperRepo)
      : super(LastOperationInitial());

  Future<void> initial() async {
    monthRepositoty.getMonth().listen(_listenerMonth);
    createOperRepo.getNewOperation().listen(_listenerNewOperation);
    await _getMonthOperationes(DateTime.now());
  }

  Future<void> _listenerMonth(int event) async {
    final date = monthRepositoty.listOfMonth[event];
    await _getMonthOperationes(date);
  }

  void _listenerNewOperation(ItemOperationModel model) {
    final isAdded = lastOperationRepo.addNewOperationes(model);
    if (isAdded) {
      emit(LastOperationLoadingState());
      final list = lastOperationRepo.operationes;
      emit(LastOperationLoadedState(list));
    }
  }

  Future<void> _getMonthOperationes(DateTime dateTime) async {
    emit(LastOperationLoadingState());
    try {
      final list = await lastOperationRepo.getLastOperationes(dateTime);
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
    return lastOperationRepo.getCategoryById(id);
  }
}
