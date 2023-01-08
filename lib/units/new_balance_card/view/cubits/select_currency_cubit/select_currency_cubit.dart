import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCurrencyCubit extends Cubit<SelectCurrencyState> {
  final CreateBalanceCardRepo _createBalanceRepo;
  final CurrenciesRepo _currenciesRepo;
  SelectCurrencyCubit(
    this._createBalanceRepo,
    this._currenciesRepo,
  ) : super(SelectCurrencyInitialState());

  Future<void> initial() async {
    _currenciesRepo.handleCurrencyData.listen(_listenCurrencyData);
    emit(SelectCurrencyLoadedState(_createBalanceRepo.currentCurrencyData));
  }

  void saveChoise() {
    emit(SelectCurrencySaveSelectState());
  }

  void _listenCurrencyData(CurrencyData data) {
    _createBalanceRepo.selectCurrencyData(data);
    emit(SelectCurrencyLoadedState(data));
  }

  @override
  Future<void> close() async {
    _currenciesRepo.dispose();
    
  }
}
