import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/services/last_operationes_services.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';

class LastOperationesRepoImpl implements LastOperationesRepo {
  @override
  Future<List<ItemOperationModel>> getLastOperationes() {
    return getIt<LastOperationesSevices>().getLastOperationes();
  }
  
}