import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:flutter/material.dart';

abstract class BalanceAmountState implements Equatable {}

class BalanceAmountInitialState implements BalanceAmountState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class BalanceAmountLoadingState implements BalanceAmountState {
  @override
  List<Object?> get props => [2];

  @override
  bool? get stringify => true;
}

class BalanceAmountCreateFinishState implements BalanceAmountState {
  @override
  List<Object?> get props => [3];

  @override
  bool? get stringify => true;
}

class BalanceAmountLoadedState implements BalanceAmountState {
  final TextEditingController textController;
  final CurrencyData currencyData;

  BalanceAmountLoadedState(this.textController, this.currencyData);

  @override
  List<Object?> get props => [textController, currencyData];

  @override
  bool? get stringify => true;
}
