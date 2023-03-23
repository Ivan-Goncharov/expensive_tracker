import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class StatsService {
  /// Получение всех операций
  Future<List<ItemOperationModel>> getAllOperations(String cardId);

  /// Получение категорий
  Future<HashSet<CategoriesOperationTableData>> getCategories();
}

class StatsServiceImpl implements StatsService {
  late final AppDb _db;
  StatsServiceImpl(StorageProvider provider) {
    _db = provider.database;
  }

  @override
  Future<List<ItemOperationModel>> getAllOperations(String cardId) {
    return _db.getAllNotesOperation(cardId);
  }

  @override
  Future<HashSet<CategoriesOperationTableData>> getCategories() async {
    final result = await _db.getAllCategories();
    return HashSet()..addAll(result);
  }
}
