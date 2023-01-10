import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class AddNewBalanceCardState implements Equatable {}

class AddNewBalanceCardInitialState implements AddNewBalanceCardState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class AddNewBalanceCardLoadingState implements AddNewBalanceCardState {
  @override
  List<Object?> get props => [2];

  @override
  bool? get stringify => true;
}

class AddNewBalanceCardLoadedState implements AddNewBalanceCardState {
  final CurrencyData? currencyData;
  final bool isVisibleButton;
  AddNewBalanceCardLoadedState(this.isVisibleButton, {this.currencyData});
  @override
  List<Object?> get props => [currencyData, isVisibleButton];

  @override
  bool? get stringify => true;
}
