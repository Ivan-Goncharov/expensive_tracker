import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/scroll_balance_cubit/cubit/scroll_balance_state.dart';
import 'package:flutter/material.dart';

class ScrollBalanceCubit extends Cubit<ScrollBalanceState> {
  final BalanceCardRepo _repo;
  ScrollBalanceCubit(this._repo) : super(ScrollBalanceInitialState());
  final _pageController = PageController(viewportFraction: 0.8);

  void initial() {
    emit(ScrollBalanceLoadedState(_repo.listOfCards, _pageController));
    _pageController.addListener(() {
      final page = _pageController.page!;
      if (page == page.roundToDouble()) {
        _repo.addCardInStream(_repo.listOfCards[_pageController.page!.toInt()]);
      }
    });
  }
}
