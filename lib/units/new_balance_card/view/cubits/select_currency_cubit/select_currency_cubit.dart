import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCurrencyCubit extends Cubit<SelectCurrencyState> {
  final CreateBalanceCardRepo _repo;
  SelectCurrencyCubit(this._repo) : super(SelectCurrencyInitialState());

  void initial() {
    _repo.handleCurrencyData.listen(_listenCurrencyData);
    emit(SelectCurrencyLoadedState(_repo.currentCurrencyData));
  }

  void saveChoise() {
    emit(SelectCurrencySaveSelectState());
  }

  void _listenCurrencyData(CurrencyData data) {
    emit(SelectCurrencyLoadedState(data));
  }
}
