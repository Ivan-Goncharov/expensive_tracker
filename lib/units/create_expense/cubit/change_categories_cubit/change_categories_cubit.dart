import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';

part 'change_categories_state.dart';

class ChangeCategoriesCubit extends Cubit<ChangeCategoriesState> {
  final LastOperationesRepo lastOperRepo;
  ChangeCategoriesCubit(this.lastOperRepo) : super(CreateOperationInitial());
  List<CategoriesOperationTableData> listExpense = [];
  List<CategoriesOperationTableData> listIncome = [];

  void initial() {
    listExpense = lastOperRepo.getTypeCategories(OperationType.expense);
    // print('DEBUG EXPENSE ${listExpense}');
    listIncome = lastOperRepo.getTypeCategories(OperationType.income);
    // print('DEBUG income ${listIncome}');

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
