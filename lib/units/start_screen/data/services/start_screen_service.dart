import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/constants/shared_pref_constants.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartScreenService {
  /// Заходим ли мы впервые в приложение или нет.
  /// [true] - если уже заходили.
  Future<bool> isNotFirstStart();

  Future<void> saveFirstStart();

  Future<List<CategoriesOperationTableData>> getCategories();

  Future<List<DateTime>> getMonthList();
}

class StartScreenServiceImpl implements StartScreenService {
  @override
  Future<bool> isNotFirstStart() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final isFirstStart = prefs.getBool(isFirstStartConst);
      if (isFirstStart == null) {
        return false;
      } else {
        return isFirstStart;
      }
    } catch (er, st) {
      debugPrint('$er\n$st');
      return false;
    }
  }

  @override
  Future<void> saveFirstStart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstStartConst, true);
  }

  @override
  Future<List<CategoriesOperationTableData>> getCategories() {
    return database.getAllCategories();
  }

  @override
  Future<List<DateTime>> getMonthList() async {
    final lastDate = await database.getTimeSingleOperation(OrderingMode.desc);
    final firstDate = await database.getTimeSingleOperation(OrderingMode.asc);
    final list = <DateTime>[];
    var tempDate = DateTime(firstDate.year, firstDate.month);

    while (tempDate.difference(lastDate).inDays <= 0) {
      list.add(tempDate);
      if (tempDate.month == 12) {
        tempDate = DateTime(tempDate.year + 1, 1);
      } else {
        tempDate = DateTime(tempDate.year, tempDate.month + 1);
      }
    }
    return list;
  }
}
