import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/operations_stats_state.dart';
import 'package:expensive_tracker_app/units/operationes_stats/domain/stats_repo.dart';

class OperationsStatsCubit extends Cubit<OperationsStatsState> {
  final BalanceCardRepo _balanceCardRepo;
  final StatsRepository _statsRepo;
  final CurrenciesRepo _currenciesRepo;
  OperationsStatsCubit(
    this._balanceCardRepo,
    this._statsRepo,
    this._currenciesRepo,
  ) : super(OperationsStatsLoading());

  ItemBalanceCardModel? _balanceCard;
  CurrencyData? _currencyData;
  ItemBalanceCardModel get balanceCard => _balanceCard!;
  CurrencyData get currencyData => _currencyData!;

  Future<void> init() async {
    _balanceCard = _balanceCardRepo.currentBalanceCard;
    _currencyData =
        await _currenciesRepo.getCurrencyById(_balanceCard!.currencyId);
    final listOfOperations =
        await _statsRepo.getAllOperations(_balanceCard!.id);
    await _statsRepo.getCategories();
    emit(OperationsStatsLoaded(listOfOperations));
  }
}
