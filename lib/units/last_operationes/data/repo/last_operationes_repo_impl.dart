import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/services/last_operationes_services.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';

class LastOperationesRepoImpl implements LastOperationesRepo {
  final LastOperationesSevices lastOperService;
  LastOperationesRepoImpl(this.lastOperService);

  List<CategoriesOperationTableData> _categories = [];

  List<ItemOperationModel> _operationes = [];

  @override
  List<CategoriesOperationTableData> get categories => _categories;

  @override
  List<ItemOperationModel> get operationes => _operationes;

  @override
  Future<List<ItemOperationModel>> getLastOperationes(DateTime date) async {
    _operationes = await lastOperService.getLastOperationes(date);
    return _operationes;
  }

  @override
  set categories(List<CategoriesOperationTableData> val) => _categories = val;

  @override
  List<CategoriesOperationTableData> getTypeCategories(OperationType type) {
    return _categories.where((element) => element.type == type).toList();
  }

  @override
  bool addNewOperationes(ItemOperationModel operationModel) {
    final currentDate = getIt<MonthRepositoty>().currentDate;
    if (currentDate == null) {
      _operationes.add(operationModel);
      return true;
    }

    if (currentDate.year == operationModel.dateOperation.year &&
        currentDate.month == operationModel.dateOperation.month) {
      _operationes.add(operationModel);

      _operationes.sort((a, b) => b.dateOperation.compareTo(a.dateOperation));
      return true;
    }
    return false;
  }

  @override
  CategoriesOperationTableData getCategoryById(int id) {
    return _categories.firstWhere((element) => element.id == id);
  }
}
