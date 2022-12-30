import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';

part 'change_categories_state.dart';

class ChangeCategoriesCubit extends Cubit<ChangeCategoriesState> {
  final LastOperationesRepo lastOperRepo;
  ChangeCategoriesCubit(this.lastOperRepo) : super(CreateOperationInitial());
  List<OperationCategories> listExpense = [];
  List<OperationCategories> listIncome = [];

  void initial() {
    listExpense = lastOperRepo.getTypeCategories(OperationType.expense);
    listExpense = lastOperRepo.getTypeCategories(OperationType.income);
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
