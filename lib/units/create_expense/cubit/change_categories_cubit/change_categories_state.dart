part of 'change_categories_cubit.dart';

abstract class ChangeCategoriesState {}

class CreateOperationInitial extends ChangeCategoriesState {}

class CreateExpenseState extends ChangeCategoriesState {
  final List<OperationCategories> expenseCategory;
  CreateExpenseState(this.expenseCategory);
}

class CreateIncomeState extends ChangeCategoriesState {
  final List<OperationCategories> incomeCategory;
  CreateIncomeState(this.incomeCategory);
}
