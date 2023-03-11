import 'package:equatable/equatable.dart';

// coverage:ignore-file
class MonthOperationAmountModel implements Equatable {
  final double income;
  final double expense;
  final DateTime monthAndYear;

  const MonthOperationAmountModel({
    required this.expense,
    required this.income,
    required this.monthAndYear,
  });

  MonthOperationAmountModel changeValue({
    required bool isIncome,
    required double value,
  }) {
    return MonthOperationAmountModel(
      expense: isIncome ? expense : expense + value,
      income: isIncome ? income + value : income,
      monthAndYear: monthAndYear,
    );
  }

  bool isSameDate(DateTime date) {
    return monthAndYear.year == date.year && monthAndYear.month == date.month;
  }

  @override
  List<Object?> get props => [income, expense];

  @override
  bool? get stringify => true;
}
