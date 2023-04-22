import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:expensive_tracker_app/units/operationes_stats/data/stats_service.dart';
import 'package:expensive_tracker_app/units/operationes_stats/domain/stats_repo.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsService _statsService;
  StatsRepositoryImpl(this._statsService);

  var _categories = HashSet<CategoriesOperationTableData>();

  @override
  Future<List<ItemOperationModel>> getAllOperations(String cardId) {
    return _statsService.getAllOperations(cardId);
  }

  @override
  Future<void> getCategories() async {
    _categories = await _statsService.getCategories();
  }

  @override
  CategoriesOperationTableData getCategoriesById(int id) =>
      _categories.firstWhere((element) => element.id == id);

  @override
  Map<StatsDateType, List<DateTime>> createMapOfDateType(
    List<ItemOperationModel> operationes,
  ) {
    final mapOfDateType = <StatsDateType, List<DateTime>>{};
    final dateTimeNow = DateTime.now();
    mapOfDateType[StatsDateType.today] = [
      DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day)
    ];
    mapOfDateType[StatsDateType.yesterDay] = [
      DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day - 1)
    ];
    mapOfDateType[StatsDateType.thisWeek] = [
      DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day - 7)
    ];
    mapOfDateType[StatsDateType.month] = _getListMonth(operationes);

    mapOfDateType[StatsDateType.year] = _getListOfYear(operationes);

    return mapOfDateType;
  }

  List<DateTime> _getListMonth(List<ItemOperationModel> operationes) {
    final dateList = <DateTime>[];
    for (final item in operationes) {
      final currentDate = item.dateOperation;
      if (currentDate.year != DateTime.now().year) {
        continue;
      }
      final compareDate = DateTime(currentDate.year, currentDate.month);
      if (!dateList.contains(compareDate)) {
        dateList.add(compareDate);
      }
      if (dateList.length == 12) break;
    }
    return dateList;
  }

  List<DateTime> _getListOfYear(List<ItemOperationModel> operationes) {
    final dateList = <DateTime>[];
    for (final item in operationes) {
      final itemDate = DateTime(item.dateOperation.year, 1);
      if (!dateList.contains(itemDate)) {
        dateList.add(itemDate);
      }
      if (dateList.length == 12) break;
    }
    return dateList;
  }
}
