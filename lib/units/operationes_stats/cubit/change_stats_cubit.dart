import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:expensive_tracker_app/units/operationes_stats/domain/stats_repo.dart';

class ChangeStatsCubit extends Cubit<ChangeStatsState> {
  final StatsRepository _statsRepo;
  ChangeStatsCubit(this._statsRepo) : super(ChangeStatsLoading());

  List<ItemOperationModel> _operations = [];
  var _mapOfDateType = <StatsDateType, List<DateTime>>{};

  /// Текущий выбранный тип даты
  var _currentStatsDateType = StatsDateType.today;

  /// Мапа с типами даты и списком дат
  Map<StatsDateType, List<DateTime>> get mapOfDateType => _mapOfDateType;

  void init(List<ItemOperationModel> operationsValue) {
    _operations = operationsValue;
    _mapOfDateType = _statsRepo.createMapOfDateType(_operations);
    print('DEBUG MAP OF TYPE ${_mapOfDateType}');
    emit(
      ChangeStatsLoaded(
        _currentStatsDateType,
        _createDayListOper(_mapOfDateType[StatsDateType.today]!.first),
      ),
    );
  }

  List<ItemOperationModel> _createDayListOper(DateTime date) {
    final list = <ItemOperationModel>[];
    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (DateTime(
              operationDate.year, operationDate.month, operationDate.day) ==
          date) {
        list.add(oper);
      }
    }
    return list;
  }
}
