import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:flutter/material.dart';

abstract class ScrollBalanceState implements Equatable {}

class ScrollBalanceInitialState implements ScrollBalanceState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class ScrollBalanceLoadedState implements ScrollBalanceState {
  final PageController pageController;
  final List<ItemBalanceCardModel> listOfCards;
  ScrollBalanceLoadedState(this.listOfCards, this.pageController);

  @override
  List<Object?> get props => [listOfCards];

  @override
  bool? get stringify => true;
}
