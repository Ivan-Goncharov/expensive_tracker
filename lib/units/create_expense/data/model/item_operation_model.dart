import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';

class ItemOperationModel extends Equatable {
  final String category;
  final double amount;
  final OperationType type;
  final DateTime date;
  const ItemOperationModel({
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
  });

  @override
  List<Object?> get props => [category, amount, type, date];
 
}

enum OperationType {
  income,
  expense,
}
