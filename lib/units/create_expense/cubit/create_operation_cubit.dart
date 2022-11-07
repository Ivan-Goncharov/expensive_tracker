import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/constants/operation_categories.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  CreateOperationCubit() : super(CreateOperationInitial());

  void initial() {
    emit(CreateExpenseState(listExpense));
  }

  void changeState(int index) {
    if (index == 0) {
      emit(CreateExpenseState(listExpense));
    } else {
      emit(CreateIncomeState(listIncome));
    }
  }
}
