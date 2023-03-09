import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
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
  final CurrencyData currencyData;
  LastOperationLoadedState(this.operations, this.currencyData);
  @override
  List<Object?> get props => [operations, currencyData];
}

class LastOperationEmptyState extends LastOperationState {
  @override
  List<Object?> get props => [];
}

class LastOperationErrorState extends LastOperationState {
  @override
  List<Object?> get props => [];
}
