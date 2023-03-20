import 'package:equatable/equatable.dart';

abstract class OperationsStatsState extends Equatable {}

class OperationsStatsLoading extends OperationsStatsState {
  @override
  List<Object?> get props => [1];
}

class OperationsStatsLoaded extends OperationsStatsState {
  @override
  List<Object?> get props => [3];
}

class OperationsStatsError extends OperationsStatsState {
  @override
  List<Object?> get props => [2];
}
