import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

class NavigatorCubit extends Cubit<NavigationState> {
  final BalanceCardRepo _repo;
  NavigatorCubit(this._repo) : super(NavigationInitial());

  /// Индекс текущей страницы.
  var _currentPage = 0;

  /// Контроллер для прокрутки списка трат.
  final _scrollController = ScrollController();

  void changePage(int index) {
    _currentPage = index;
    emit(NavigationChangePageState(
      currentPage: _currentPage,
      scrollController: _scrollController,
      listOfCards: _repo.listOfCards,
      selectIdCard: _repo.currentBalanceCard!.id,
    ));
  }

  void initial() {
    emit(NavigationChangePageState(
      currentPage: _currentPage,
      scrollController: _scrollController,
      listOfCards: _repo.listOfCards,
      selectIdCard: _repo.currentBalanceCard!.id,
    ));
  }
}
