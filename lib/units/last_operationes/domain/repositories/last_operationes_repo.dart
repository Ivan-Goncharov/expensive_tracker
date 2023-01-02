import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';

abstract class LastOperationesRepo {
  List<OperationCategories> get categories;
  set categories(List<OperationCategories> val);

  List<ItemOperationModel> get operationes;
  Future<List<ItemOperationModel>> getLastOperationes(DateTime date);
  bool addNewOperationes(ItemOperationModel operationModel);

  List<OperationCategories> getTypeCategories(OperationType type);
  OperationCategories getCategoryById(String id);
}
