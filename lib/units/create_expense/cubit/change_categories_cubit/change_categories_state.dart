part of 'change_categories_cubit.dart';

abstract class ChangeCategoriesState {}

class CreateOperationInitial extends ChangeCategoriesState {}

class CreateExpenseState extends ChangeCategoriesState {
  final List<CategoriesOperationTableData> expenseCategory;
  CreateExpenseState(this.expenseCategory);
}

class CreateIncomeState extends ChangeCategoriesState {
  final List<CategoriesOperationTableData> incomeCategory;
  CreateIncomeState(this.incomeCategory);
}
