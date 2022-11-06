import 'package:bloc/bloc.dart';

part 'create_operation_state.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  CreateOperationCubit() : super(CreateOperationInitial());

  void initial() {
    emit(CreateExpenseState());
  }

  void changeState(int index) {
    if (index == 0) {
      emit(CreateExpenseState());
    } else {
      emit(CreateIncomeState());
    }
  }
}
