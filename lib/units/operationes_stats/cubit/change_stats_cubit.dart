import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:expensive_tracker_app/units/operationes_stats/data/entity/stats_model_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/domain/stats_repo.dart';

class ChangeStatsCubit extends Cubit<ChangeStatsState> {
  final StatsRepository _statsRepo;
  ChangeStatsCubit(this._statsRepo) : super(ChangeStatsLoading());

  List<ItemOperationModel> _operations = [];

  /// Мапа с типами даты и списком дат
  var _mapOfDateType = <StatsDateType, List<DateTime>>{};

  /// Мапа с датами и моделями статистики для каждой даты
  final _mapOfStatsModel = <DateTime, StatsModel>{};

  /// Текущий выбранный тип даты
  var _currentStatsDateType = StatsDateType.today;

  /// Текущий тип траназакций
  final _currentOperationType = OperationType.expense;
  DateTime? _currentStatsMonth;
  DateTime? _currentStatsYear;

  void init(List<ItemOperationModel> operationsValue) {
    _operations = operationsValue;
    _mapOfDateType = _statsRepo.createMapOfDateType(_operations);
    _currentStatsMonth = _mapOfDateType[StatsDateType.month]?.first;
    _currentStatsYear = _mapOfDateType[StatsDateType.year]?.first;
    _emitChangeStatsEvent(
        _createDayListOper(_mapOfDateType[StatsDateType.today]!.first));
  }

  /// Cмена выбранного типа
  void changeType(StatsDateType type, {DateTime? dateTime}) {
    _currentStatsDateType = type;
    _emitChangeStatsEvent(
        _createOperationsSpecificList(type, dateTime: dateTime));
  }

  /// Прокидывание event ChangeStatsLoaded
  void _emitChangeStatsEvent(StatsModel statsModel) => emit(ChangeStatsLoaded(
        dateType: _currentStatsDateType,
        statsModel: statsModel,
        mapOfDateType: _mapOfDateType,
        currentStatsMonth: _currentStatsMonth ?? DateTime.now(),
        currentStatsYear: _currentStatsYear ?? DateTime.now(),
      ));

  StatsModel _createOperationsSpecificList(StatsDateType type,
      {DateTime? dateTime}) {
    late StatsModel statsModel;
    switch (type) {
      case StatsDateType.today:
        statsModel =
            _createDayListOper(_mapOfDateType[StatsDateType.today]!.first);
        break;
      case StatsDateType.yesterDay:
        statsModel =
            _createDayListOper(_mapOfDateType[StatsDateType.yesterDay]!.first);
        break;
      case StatsDateType.thisWeek:
        statsModel = _createWeekTransaction(
            _mapOfDateType[StatsDateType.thisWeek]!.first);
        break;
      case StatsDateType.month:
        final currentDate =
            dateTime ?? _mapOfDateType[StatsDateType.month]?.first;
        if (currentDate != null) {
          statsModel = _createAllTimeOperMap(currentDate);
        }
        break;
      case StatsDateType.year:
        final currentDate =
            dateTime ?? _mapOfDateType[StatsDateType.year]?.first;
        if (currentDate != null) {
          statsModel = _createAllTimeOperMap(currentDate, isMonth: false);
        }
        break;
      case StatsDateType.allTime:
        statsModel = _createYearOrMonthListOper();
        break;
    }
    return statsModel;
  }

  /// Создание списка Модели статистики за один день по категориям.
  StatsModel _createDayListOper(DateTime date) {
    if (_mapOfStatsModel.containsKey(date)) {
      return _mapOfStatsModel[date]!;
    }

    final mapOfModels = <int, List<ItemOperationModel>>{};
    final maoOfSummOperations = <int, double>{};

    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (DateTime(
                operationDate.year,
                operationDate.month,
                operationDate.day,
              ) ==
              date &&
          oper.type == _currentOperationType) {
        if (mapOfModels.containsKey(oper.category)) {
          mapOfModels[oper.category]?.add(oper);
        } else {
          mapOfModels[oper.category] = [oper];
        }

        maoOfSummOperations[oper.category] =
            (maoOfSummOperations[oper.category] ?? 0.0) + oper.amount;
      }
    }
    final statsModel = StatsModel.create(
      mapOfOperationes: mapOfModels,
      categorySpendMap: maoOfSummOperations,
    );

    _mapOfStatsModel[date] = statsModel;
    return statsModel;
  }

  /// Создание списка трат недельных
  StatsModel _createWeekTransaction(DateTime date) {
    if (_mapOfStatsModel.containsKey(date)) {
      return _mapOfStatsModel[date]!;
    }

    final mapOfModels = <int, List<ItemOperationModel>>{};
    final maoOfSummOperations = <int, double>{};

    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (oper.type == OperationType.expense &&
          operationDate.millisecondsSinceEpoch > date.millisecondsSinceEpoch &&
          operationDate.millisecondsSinceEpoch <
              DateTime.now().millisecondsSinceEpoch) {
        if (mapOfModels.containsKey(oper.category)) {
          mapOfModels[oper.category]?.add(oper);
        } else {
          mapOfModels[oper.category] = [oper];
        }
        maoOfSummOperations[oper.category] =
            (maoOfSummOperations[oper.category] ?? 0.0) + oper.amount;
      }
    }

    final statsModel = StatsModel.create(
      mapOfOperationes: mapOfModels,
      categorySpendMap: maoOfSummOperations,
    );

    _mapOfStatsModel[date] = statsModel;
    return statsModel;
  }

  /// Создание списка трат для года или месяца
  StatsModel _createAllTimeOperMap(
    DateTime date, {
    bool isMonth = true,
  }) {
    if (_mapOfStatsModel.containsKey(date)) {
      return _mapOfStatsModel[date]!;
    }
    final mapOfModels = <int, List<ItemOperationModel>>{};
    final maoOfSummOperations = <int, double>{};

    for (final oper in _operations) {
      final operationDate = oper.dateOperation;
      if (DateTime(operationDate.year, isMonth ? operationDate.month : 1) ==
              date &&
          oper.type == _currentOperationType) {
        if (mapOfModels.containsKey(oper.category)) {
          mapOfModels[oper.category]?.add(oper);
        } else {
          mapOfModels[oper.category] = [oper];
        }
        maoOfSummOperations[oper.category] =
            (maoOfSummOperations[oper.category] ?? 0.0) + oper.amount;
      }
    }
    final statsModel = StatsModel.create(
      mapOfOperationes: mapOfModels,
      categorySpendMap: maoOfSummOperations,
    );

    _mapOfStatsModel[date] = statsModel;
    return statsModel;
  }

  /// Cоздание мапы с тратами по категориям за все время
  StatsModel _createYearOrMonthListOper() {
    final date = DateTime.fromMillisecondsSinceEpoch(0);
    if (_mapOfStatsModel.containsKey(date)) {
      return _mapOfStatsModel[date]!;
    }
    final mapOfModels = <int, List<ItemOperationModel>>{};
    final maoOfSummOperations = <int, double>{};

    for (final oper in _operations) {
      if (oper.type == _currentOperationType) {
        if (mapOfModels.containsKey(oper.category)) {
          mapOfModels[oper.category]?.add(oper);
        } else {
          mapOfModels[oper.category] = [oper];
        }
        maoOfSummOperations[oper.category] =
            (maoOfSummOperations[oper.category] ?? 0.0) + oper.amount;
      }
    }
    final statsModel = StatsModel.create(
      mapOfOperationes: mapOfModels,
      categorySpendMap: maoOfSummOperations,
    );

    _mapOfStatsModel[date] = statsModel;
    return statsModel;
  }

  /// Получение категории по ID
  CategoriesOperationTableData getCategoriesById(int id) =>
      _statsRepo.getCategoriesById(id);
}
