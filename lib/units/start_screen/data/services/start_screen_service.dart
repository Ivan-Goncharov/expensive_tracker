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
  /// Заходим ли мы впервые в приложение или нет.
  /// [true] - если уже заходили.
  Future<bool> isNotFirstStart();

  Future<void> saveFirstStart();

  Future<List<OperationCategories>> getCategories();

  Future<List<DateTime>> getMonthList();

  /// Cохранение категорий из json.
  Future<void> createAndSaveCategories({
    required String asset,
    required OperationType type,
  });
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
    await createAndSaveCategories(
      asset: 'assets/categories_json/categories_income.json',
      type: OperationType.income,
    );
    await createAndSaveCategories(
      asset: 'assets/categories_json/categories_expense.json',
      type: OperationType.expense,
    );

    await _saveStartCurrency();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstStartConst, true);
  }

  Future<void> _saveStartCurrency() async {
    var data = await rootBundle.loadString('assets/currencies/currensies.json');
    final map = Map<String, dynamic>.from(jsonDecode(data));

    map.forEach((key, value) async {
      await database.into(database.currency).insert(CurrencyCompanion.insert(
            name: value['name'],
            code: value['code'],
            symbol: value['symbol'],
            type: 0,
          ));
    });

    data =
        await rootBundle.loadString('assets/currencies/crypto_currensies.json');
    for (final i in jsonDecode(data)) {
      await database.into(database.currency).insert(
            CurrencyCompanion.insert(
                name: i['name'], code: i['code'], symbol: i['symbol'], type: 1),
          );
    }
  }

  @override
  Future<void> createAndSaveCategories({
    required String asset,
    required OperationType type,
  }) async {
    final data = await rootBundle.loadString(asset);
    final list = jsonDecode(data)['categories'] as List<dynamic>;
    for (final i in list) {
      final category = OperationCategories.create(
        title: i['title']!,
        code: i['code']!,
        type: type,
      );
      await database.addNewCategory(category.toInsertable());
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
