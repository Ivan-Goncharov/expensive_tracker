import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/services/last_operationes_services.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';

class LastOperationesRepoImpl implements LastOperationesRepo {
  List<OperationCategories> _categories = [];

  List<ItemOperationModel> _operationes = [];

  @override
  List<OperationCategories> get categories => _categories;

  @override
  List<ItemOperationModel> get operationes => _operationes;

  @override
  Future<List<ItemOperationModel>> getLastOperationes() async {
    _operationes = await getIt<LastOperationesSevices>().getLastOperationes();
    return _operationes;
  }

  @override
  set categories(List<OperationCategories> val) => _categories = val;

  List<OperationCategories> getTypeCategories(OperationType type) {
    return _categories.where((element) => element.type == type).toList();
  }
}
