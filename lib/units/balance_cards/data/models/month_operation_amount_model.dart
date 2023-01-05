import 'package:equatable/equatable.dart';

class MonthOperationAmountModel implements Equatable {
  final double income;
  final double expense;

  const MonthOperationAmountModel({
    required this.expense,
    required this.income,
  });

  MonthOperationAmountModel copyWith({
    double? newIncome,
    double? newExpense,
   }) =>
      MonthOperationAmountModel(
        expense: newExpense ?? expense,
        income: newIncome ?? income,
      );

  @override
  List<Object?> get props => [income, expense];

  @override
  bool? get stringify => true;
}
