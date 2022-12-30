import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';

abstract class LastOperationesRepo {
  List<OperationCategories> get categories;
  List<ItemOperationModel> get operationes;
  set categories(List<OperationCategories> val);

  Future<List<ItemOperationModel>> getLastOperationes();
  List<OperationCategories> getTypeCategories(OperationType type);
}
