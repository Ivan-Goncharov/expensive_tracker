import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:expensive_tracker_app/units/operationes_stats/data/stats_service.dart';
import 'package:expensive_tracker_app/units/operationes_stats/domain/stats_repo.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsService _statsService;
  StatsRepositoryImpl(this._statsService);

  var _categories =HashSet<CategoriesOperationTableData>();

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
    final dateTime = DateTime.now();
    mapOfDateType[StatsDateType.today] = [
      DateTime(dateTime.year, dateTime.month, dateTime.day)
    ];
    mapOfDateType[StatsDateType.yesterDay] = [
      DateTime(dateTime.year, dateTime.month, dateTime.day - 1)
    ];
    mapOfDateType[StatsDateType.thisWeek] = [
      DateTime(dateTime.year, dateTime.month, dateTime.day - 7)
    ];
    mapOfDateType[StatsDateType.month] = _getListOfDate(operationes);

    mapOfDateType[StatsDateType.year] = _getListOfDate(
      operationes,
      isCompareMonth: false,
    );

    return mapOfDateType;
  }

  List<DateTime> _getListOfDate(
    List<ItemOperationModel> operationes, {
    bool isCompareMonth = true,
  }) {
    final dateList = <DateTime>[];
    for (final item in operationes) {
      var itemDate = item.dateOperation;
      itemDate = DateTime(itemDate.year, isCompareMonth ? itemDate.month : 1);
      if (!dateList.contains(itemDate)) {
        dateList.add(itemDate);
      }
      if (dateList.length == 12) break;
    }
    return dateList;
  }
}
