import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

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
  BalanceCardLoadedState(this.currencyData, this.balanceCardModel);

  @override
  List<Object?> get props => [currencyData, balanceCardModel];

  @override
  bool? get stringify => true;
}
