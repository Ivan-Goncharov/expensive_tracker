import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
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

  /// Текущий тип траназакций
  var _currentOperationType = OperationType.expense;
  DateTime? _currentStatsMonth;
  DateTime? _currentStatsYear;

  /// Мапа с типами даты и списком дат
  Map<StatsDateType, List<DateTime>> get mapOfDateType => _mapOfDateType;

  /// Текущий выбранный месяц
  DateTime get currentStatsMonth => _currentStatsMonth ?? DateTime.now();

  /// Текущий выбранный год
  DateTime get currentStatsYear => _currentStatsYear ?? DateTime.now();

  void init(List<ItemOperationModel> operationsValue) {
    _operations = operationsValue;
    _mapOfDateType = _statsRepo.createMapOfDateType(_operations);
    _currentStatsMonth = _mapOfDateType[StatsDateType.month]?.first;
    _currentStatsYear = _mapOfDateType[StatsDateType.year]?.first;
    final map = _createDayListOper(_mapOfDateType[StatsDateType.today]!.first);

    emit(
      ChangeStatsLoaded(
        _currentStatsDateType,
        map,
        _getSummElements(map),
      ),
    );
  }

  /// Cмена выбранного типа
  void changeType(StatsDateType type, {DateTime? dateTime}) {
    _currentStatsDateType = type;
    final map = _createOperationsSpecificList(type, dateTime: dateTime);
    emit(
      ChangeStatsLoaded(
        _currentStatsDateType,
        map,
        _getSummElements(map),
      ),
    );
  }

  Map<int, List<ItemOperationModel>> _createOperationsSpecificList(
      StatsDateType type,
      {DateTime? dateTime}) {
    var map = <int, List<ItemOperationModel>>{};
    switch (type) {
      case StatsDateType.today:
        map = _createDayListOper(_mapOfDateType[StatsDateType.today]!.first);
        break;
      case StatsDateType.yesterDay:
        map =
            _createDayListOper(_mapOfDateType[StatsDateType.yesterDay]!.first);
        break;
      case StatsDateType.thisWeek:
        map = _createWeekTransaction(
            _mapOfDateType[StatsDateType.thisWeek]!.first);
        break;
      case StatsDateType.month:
        final currentDate =
            dateTime ?? _mapOfDateType[StatsDateType.month]?.first;
        if (currentDate != null) {
          map = _createAllTimeOperMap(currentDate);
        }
        break;
      case StatsDateType.year:
        final currentDate =
            dateTime ?? _mapOfDateType[StatsDateType.year]?.first;
        if (currentDate != null) {
          map = _createAllTimeOperMap(currentDate, isMonth: false);
        }
        break;
      case StatsDateType.allTime:
        map = _createYearOrMonthListOper();
        break;
    }
    return map;
  }

  Map<int, List<ItemOperationModel>> _createDayListOper(DateTime date) {
    final map = <int, List<ItemOperationModel>>{};
    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (DateTime(
                operationDate.year,
                operationDate.month,
                operationDate.day,
              ) ==
              date &&
          oper.type == _currentOperationType) {
        if (map.containsKey(oper.category)) {
          map[oper.category]?.add(oper);
        } else {
          map[oper.category] = [oper];
        }
      }
    }
    return map;
  }

  /// Создание списка трат недельных
  Map<int, List<ItemOperationModel>> _createWeekTransaction(DateTime date) {
    final map = <int, List<ItemOperationModel>>{};

    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (oper.type == OperationType.expense &&
          operationDate.millisecondsSinceEpoch > date.millisecondsSinceEpoch &&
          operationDate.millisecondsSinceEpoch <
              DateTime.now().millisecondsSinceEpoch) {
        if (map.containsKey(oper.category)) {
          map[oper.category]?.add(oper);
        } else {
          map[oper.category] = [oper];
        }
      }
    }
    return map;
  }

  /// Создание списка трат для года или месяца
  Map<int, List<ItemOperationModel>> _createAllTimeOperMap(DateTime date,
      {bool isMonth = true}) {
    final map = <int, List<ItemOperationModel>>{};

    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (DateTime(operationDate.year, isMonth ? operationDate.month : 1) ==
              date &&
          oper.type == _currentOperationType) {
        if (map.containsKey(oper.category)) {
          map[oper.category]?.add(oper);
        } else {
          map[oper.category] = [oper];
        }
      }
    }
    return map;
  }

  /// Cоздание мапы с тратами по категориям за все время
  Map<int, List<ItemOperationModel>> _createYearOrMonthListOper() {
    final map = <int, List<ItemOperationModel>>{};

    for (final oper in _operations) {
      if (oper.type == _currentOperationType) {
        if (map.containsKey(oper.category)) {
          map[oper.category]?.add(oper);
        } else {
          map[oper.category] = [oper];
        }
      }
    }
    return map;
  }

  /// Получение категории по ID
  CategoriesOperationTableData getCategoriesById(int id) =>
      _statsRepo.getCategoriesById(id);

  /// Получение общей суммы элементов в списках
  double _getSummElements(Map<int, List<ItemOperationModel>> map) {
    var summ = 0.0;
    map.forEach((key, value) {
      summ += value
          .map((e) => e.amount)
          .toList()
          .reduce((value, element) => value + element);
    });
    return summ;
  }
}
