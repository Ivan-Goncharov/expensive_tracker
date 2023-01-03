import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/constants/shared_pref_constants.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartScreenService {
  Future<bool> isFirstStart();

  Future<void> saveFirstStart();

  Future<List<OperationCategories>> getCategories();

  Future<List<DateTime>> getMonthList();
}

class StartScreenServiceImpl implements StartScreenService {
  @override
  Future<bool> isFirstStart() async {
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
    await _createIncomeCategories(
        asset: 'assets/categories_json/categories_income.json',
        type: OperationType.income);
    await _createIncomeCategories(
        asset: 'assets/categories_json/categories_expense.json',
        type: OperationType.expense);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstStartConst, true);
  }

  Future<void> _createIncomeCategories({
    required String asset,
    required OperationType type,
  }) async {
    final data = await rootBundle.loadString(asset);
    final list = jsonDecode(data)['categories'] as List<dynamic>;
    for (final i in list) {
      final caategory = OperationCategories.create(
        title: i['title']!,
        code: i['code']!,
        type: type,
      );
      await database.addNewCategory(caategory.toInsertable());
    }
  }

  @override
  Future<List<OperationCategories>> getCategories() {
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