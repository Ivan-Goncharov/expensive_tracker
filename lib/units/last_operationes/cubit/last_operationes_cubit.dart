import 'package:bloc/bloc.dart';

import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';
import 'package:flutter/material.dart';

class LastOperationesCubit extends Cubit<LastOperationState> {
  final LastOperationesRepo lastOperationRepo;
  final MonthRepositoty monthRepositoty;
  LastOperationesCubit(this.lastOperationRepo, this.monthRepositoty)
      : super(LastOperationInitial());

  Future<void> initial() async {
    monthRepositoty.getMonth().listen(listenerMonth);
    await _getMonthOperationes(DateTime.now());
  }

  Future<void> listenerMonth(int event) async {
    final date = monthRepositoty.listOfMonth[event];
    await _getMonthOperationes(date);
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

  OperationCategories getCategoriesById(String id) {
    return lastOperationRepo.getCategoryById(id);
  }
}
