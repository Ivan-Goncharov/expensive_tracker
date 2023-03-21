import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class OperationsStatsState extends Equatable {}

class OperationsStatsLoading extends OperationsStatsState {
  @override
  List<Object?> get props => [1];
}

class OperationsStatsLoaded extends OperationsStatsState {
  final List<ItemOperationModel> listOperations;
  OperationsStatsLoaded(this.listOperations);
  @override
  List<Object?> get props => [listOperations];
}

class OperationsStatsError extends OperationsStatsState {
  @override
  List<Object?> get props => [2];
}
