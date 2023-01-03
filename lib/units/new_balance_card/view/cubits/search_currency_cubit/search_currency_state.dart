import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:flutter/material.dart';

abstract class SearchCurrencyState implements Equatable {}

class SearchCurrencyInitialState implements SearchCurrencyState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class SearchCurrencyChangeState implements SearchCurrencyState {
  final int selectToogleIndex;
  final TextEditingController textController;
  final List<CurrencyData> listOfCurrency;

  SearchCurrencyChangeState({
    required this.selectToogleIndex,
    required this.textController,
    required this.listOfCurrency,
  });

  @override
  List<Object?> get props => [
        selectToogleIndex,
        textController,
        listOfCurrency,
      ];

  @override
  bool? get stringify => true;
}

class SearchCurrencyEmptyState implements SearchCurrencyState {
  final int selectToogleIndex;
  final TextEditingController textController;

  SearchCurrencyEmptyState({
    required this.selectToogleIndex,
    required this.textController,
  });

  @override
  List<Object?> get props => [selectToogleIndex, textController];

  @override
  bool? get stringify => true;
}
