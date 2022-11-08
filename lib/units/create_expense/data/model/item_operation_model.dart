import 'package:equatable/equatable.dart';

class ItemOperationModel extends Equatable {
  final String category;
  final double amount;
  final OperatinType type;
  final DateTime date;
  const ItemOperationModel({
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
  });
  
  @override
  List<Object?> get props =>[category, amount, type, date];


}

enum OperatinType {
  income,
  expense,
}
