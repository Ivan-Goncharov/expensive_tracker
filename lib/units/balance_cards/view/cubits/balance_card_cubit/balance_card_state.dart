import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';

abstract class BalanceCardState implements Equatable {}

class BalanceCardInitialState implements BalanceCardState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class BalanceCardLoadedState implements BalanceCardState {
  final CurrencyData currencyData;
  final ItemBalanceCardModel balanceCardModel;
  final MonthOperationAmountModel monthOperationAmount;
  BalanceCardLoadedState({
    required this.currencyData,
    required this.balanceCardModel,
    required this.monthOperationAmount,
  });

  @override
  List<Object?> get props =>
      [currencyData, balanceCardModel, monthOperationAmount];

  @override
  bool? get stringify => true;
}

class BalanceCardErrorState implements BalanceCardState {
  @override 
  List<Object?> get props => [];

  @override 
  bool? get stringify => true;

}
