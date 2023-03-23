import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';

abstract class StatsRepository {
  /// Получение всех операций
  Future<List<ItemOperationModel>> getAllOperations(String roomId);

  /// Создание мапы с Датами операций
  Map<StatsDateType, List<DateTime>> createMapOfDateType(
    List<ItemOperationModel> operationes,
  );

  /// Получение списка категорий из БД
  Future<void> getCategories();

  /// Получение категории по ID
  CategoriesOperationTableData getCategoriesById(int id);
}
