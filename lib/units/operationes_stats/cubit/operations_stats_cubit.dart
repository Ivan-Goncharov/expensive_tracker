import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/operations_stats_state.dart';

class OperationsStatsCubit extends Cubit<OperationsStatsState> {
  final BalanceCardRepo _balanceCardRepo;
  OperationsStatsCubit(this._balanceCardRepo) : super(OperationsStatsLoading());

  ItemBalanceCardModel? _balanceCard;
  ItemBalanceCardModel get balanceCard => _balanceCard!;

  void init() {
    _balanceCard = _balanceCardRepo.currentBalanceCard;
    emit(OperationsStatsLoaded());
  }
}
