part of 'create_operation_cubit.dart';

abstract class CreateOperationState {}

class CreateOperationInitial extends CreateOperationState {}

class CreateExpenseState extends CreateOperationState {
  final List<CategoryOperationModel> expenseCategory;
  CreateExpenseState(this.expenseCategory);
}

class CreateIncomeState extends CreateOperationState {
  final List<CategoryOperationModel> incomeCategory;
  CreateIncomeState(this.incomeCategory);
}
