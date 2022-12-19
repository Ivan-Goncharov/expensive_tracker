import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class LastOperationState extends Equatable {}

class LastOperationInitial extends LastOperationState {
  @override
  List<Object?> get props => [];
}

class LastOperationLoadingState extends LastOperationState {
  @override
  List<Object?> get props => [];
}

class LastOperationLoadedState extends LastOperationState {
  final List<ItemOperationModel> operations;
  LastOperationLoadedState(this.operations);
  @override
  List<Object?> get props => [];
}

class LastOperationEmptyState extends LastOperationState {
  @override
  List<Object?> get props => [];
}

class LastOperationErrorState extends LastOperationState {
  @override
  List<Object?> get props => [];
}
