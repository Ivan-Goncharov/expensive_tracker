import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

class NavigatorCubit extends Cubit<NavigationState> {
  NavigatorCubit() : super(NavigationInitial());

  /// Индекс текущей страницы.
  var _currentPage = 0;

  /// Контроллер для прокрутки списка трат.
  final _scrollController = ScrollController();

  void changePage(int index) {
    _currentPage = index;
    emit(NavigationChangePageState(_currentPage, _scrollController));
  }

  void initial() {
    emit(NavigationChangePageState(_currentPage, _scrollController));
  }
}
