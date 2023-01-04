import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubit/balance_card_state.dart';

class BalanceCardCubit extends Cubit<BalanceCardState> {
  final BalanceCardRepo _repo;
  BalanceCardCubit(this._repo) : super(BalanceCardInitialState());

  Future<void> initial() async {
    final balanceCard = _repo.currentBalanceCard;
    final currencyData =
        await _repo.getCurrencyDataById(balanceCard.currencyId);
    emit(BalanceCardLoadedState(currencyData, balanceCard));
  }
}
