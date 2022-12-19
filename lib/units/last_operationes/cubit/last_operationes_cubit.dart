import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:flutter/material.dart';

class LastOperationesCubit extends Cubit<LastOperationState> {
  LastOperationesCubit() : super(LastOperationInitial());

  Future<void> initial() async {
    emit(LastOperationLoadingState());
    try {
      final list = await getIt<LastOperationesRepo>().getLastOperationes();
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
}
