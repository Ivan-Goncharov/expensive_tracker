import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_state.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';

class BalanceCardCubit extends Cubit<BalanceCardState> {
  final BalanceCardRepo _balanceRepo;
  final CreateOperationRepository _createOpRepo;
  final MonthRepositoty _monthRepositoty;
  final CurrenciesRepo _currenciesRepo;
  BalanceCardCubit(
    this._balanceRepo,
    this._createOpRepo,
    this._monthRepositoty,
    this._currenciesRepo,
  ) : super(BalanceCardInitialState());

  late CurrencyData _currencyData;

  Future<void> initial() async {
    final balanceCard = _balanceRepo.currentBalanceCard;
    _createOpRepo.getNewOperation().listen(_listenerCreateData);
    _monthRepositoty.getMonth().listen(_listenerMonth);
    _currencyData =
        await _currenciesRepo.getCurrencyById(balanceCard.currencyId);
    await _balanceRepo.getOperationesMonthSumm(
      DateTime(DateTime.now().year, DateTime.now().month),
    );

    emit(BalanceCardLoadedState(
      currencyData: _currencyData,
      balanceCardModel: balanceCard,
      monthOperationAmount: _balanceRepo.operationAmountModel,
    ));
  }

  Future<void> _listenerMonth(int event) async {
    final date = _monthRepositoty.listOfMonth[event];
    await _balanceRepo.getOperationesMonthSumm(date);
    emit(BalanceCardLoadedState(
      currencyData: _currencyData,
      balanceCardModel: _balanceRepo.currentBalanceCard,
      monthOperationAmount: _balanceRepo.operationAmountModel,
    ));
  }

  Future<void> _listenerCreateData(ItemOperationModel model) async {
    final flag = _balanceRepo.addNewOperation(model);
    await _balanceRepo.getNewBalanceCardAmount(model.cardId);
    await Future.delayed(const Duration(milliseconds: 250));
    if (flag) {
      emit(BalanceCardLoadedState(
        balanceCardModel: _balanceRepo.currentBalanceCard,
        currencyData: _currencyData,
        monthOperationAmount: _balanceRepo.operationAmountModel,
      ));
    }
  }
}
