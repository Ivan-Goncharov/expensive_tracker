import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class LastOperationesRepo {
  List<CategoriesOperationTableData> get categories;
  set categories(List<CategoriesOperationTableData> val);

  List<ItemOperationModel> get operationes;
  Future<List<ItemOperationModel>> getLastOperationes(DateTime date, String cardId);
  bool addNewOperationes(ItemOperationModel operationModel);

  List<CategoriesOperationTableData> getTypeCategories(OperationType type);
  CategoriesOperationTableData getCategoryById(int id);
  

}
