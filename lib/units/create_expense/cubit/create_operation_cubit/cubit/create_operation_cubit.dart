import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  CreateOperationCubit() : super(CreateOperationInitial());
  double _amount = 0;
  String _category = '';
  DateTime _dateTime = DateTime.now();
  OperatinType _type = OperatinType.expense;

  void initial() {
    emit(CreateOperationNotAllowed());
  }

  void changeAmount(double newValue) {
    _amount = newValue;
    _changeState();
  }

  void saveOperation() {
    print('DEBUG SAVE');
  }

  void _changeState() {
    if (_amount != 0 && _category.isNotEmpty) {
      emit(CreateOperationAllowed());
    } else {
      emit(CreateOperationNotAllowed());
    }
  }
}
