import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  CreateOperationCubit() : super(CreateOperationInitial());
  double _amount = 0;
  int _category = -1;
  DateTime _dateTime = DateTime.now();
  OperationType _type = OperationType.expense;

  void initial() {
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
      );
      emit(CreateOperationSucces());
    } catch (_) {
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
