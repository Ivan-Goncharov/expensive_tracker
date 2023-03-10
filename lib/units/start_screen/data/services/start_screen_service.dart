import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:flutter/material.dart';

abstract class StartScreenService {
  /// Заходим ли мы впервые в приложение или нет.
  /// [true] - если уже заходили.
  bool isNotFirstStart();

  Future<void> saveFirstStart();

  Future<List<CategoriesOperationTableData>> getCategories();

  Future<List<DateTime>> getMonthList();
}

class StartScreenServiceImpl implements StartScreenService {
  late final StorageProvider _storage;
  StartScreenServiceImpl(StorageProvider provider) {
    _storage = provider;
  }
  @override
  bool isNotFirstStart() {
    try {
      final isFirstStart =
          _storage.prefs.get(PrefKeys.isFirstStartConst) as bool?;
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
  Future<void> saveFirstStart() =>
      _storage.prefs.put(PrefKeys.isFirstStartConst, true);

  @override
  Future<List<CategoriesOperationTableData>> getCategories() =>
      _storage.database.getAllCategories();

  @override
  Future<List<DateTime>> getMonthList() async {
    final lastDate =
        await _storage.database.getTimeSingleOperation(OrderingMode.desc);
    final firstDate =
        await _storage.database.getTimeSingleOperation(OrderingMode.asc);
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
