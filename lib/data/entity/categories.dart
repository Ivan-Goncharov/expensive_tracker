import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';

import '../../units/create_expense/data/model/item_operation_model.dart';

// @UseRowClass(OperationCategories, generateInsertable: true)
class CategoriesOperationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get code => text()();
  IntColumn get type => intEnum<OperationType>()();
}
