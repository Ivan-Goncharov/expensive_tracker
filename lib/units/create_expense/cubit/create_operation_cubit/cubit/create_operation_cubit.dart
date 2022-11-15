import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  CreateOperationCubit() : super(CreateOperationInitial());
  double _amount = 0;
  String _category = '';
  DateTime _dateTime = DateTime.now();
  OperationType _type = OperationType.expense;

  void initial() {
    emit(CreateOperationNotAllowed());
  }

  void changeAmount(double newValue) {
    _amount = newValue;
    _changeState();
  }

  void changeCategory(String newCategory) {
    _category = newCategory;

    _changeState();
  }

  void changeDateTime(DateTime newDate) {
    _dateTime = newDate;
  }

  void changeType(int typeIndex) {
    emit(CreateOperationNotAllowed());
    _category = '';
    if (typeIndex == 0) {
      _type = OperationType.expense;
    } else {
      _type = OperationType.income;
    }
    _changeState();
  }

  void saveOperation() {}

  void _changeState() {
    if (_amount != 0 && _category.isNotEmpty) {
      emit(CreateOperationAllowed());
    } else {
      emit(CreateOperationNotAllowed());
    }
  }
}
