import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubit/balance_card_state.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';

class BalanceCardCubit extends Cubit<BalanceCardState> {
  final BalanceCardRepo _balanceRepo;
  final CreateOperationRepository _createOpRepo;
  BalanceCardCubit(this._balanceRepo, this._createOpRepo)
      : super(BalanceCardInitialState());

  late CurrencyData _currencyData;

  Future<void> initial() async {
    final balanceCard = _balanceRepo.currentBalanceCard;
    _createOpRepo.getNewOperation().listen(_listenerCreateData);
    _currencyData =
        await _balanceRepo.getCurrencyDataById(balanceCard.currencyId);
    await _balanceRepo.getOperationesMonthSumm(
      DateTime(DateTime.now().year, DateTime.now().month),
    );

    emit(BalanceCardLoadedState(
      currencyData: _currencyData,
      balanceCardModel: balanceCard,
      monthOperationAmount: _balanceRepo.operationAmountModel,
    ));
  }

  void _listenerCreateData(ItemOperationModel model) {
    final flag = _balanceRepo.addNewOperation(model);
    if (flag) {
      emit(BalanceCardLoadedState(
        balanceCardModel: _balanceRepo.currentBalanceCard,
        currencyData: _currencyData,
        monthOperationAmount: _balanceRepo.operationAmountModel,
      ));
    }
  }
}
