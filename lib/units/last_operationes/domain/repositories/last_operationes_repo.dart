import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class LastOperationesRepo {
  Future<List<ItemOperationModel>> getLastOperationes();
}
