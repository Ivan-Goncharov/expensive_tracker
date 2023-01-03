import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';

abstract class SelectCurrencyState extends Equatable {}

class SelectCurrencyInitialState extends SelectCurrencyState {
  @override
  List<Object?> get props => [1];
}

class SelectCurrencyLoadedState extends SelectCurrencyState {
  final CurrencyData currencyData;
  SelectCurrencyLoadedState(this.currencyData);

  @override
  List<Object?> get props => [currencyData];
}
