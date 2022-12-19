import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class LastOperationesSevices {
  Future<List<ItemOperationModel>> getLastOperationes();
}

class LastOperationesServicesImpl implements LastOperationesSevices {
  @override
  Future<List<ItemOperationModel>> getLastOperationes() {
    return database.getNotesOperation();
  }
}
