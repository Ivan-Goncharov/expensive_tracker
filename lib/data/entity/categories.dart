import 'package:drift/drift.dart';

import '../../units/create_expense/data/model/item_operation_model.dart';

// coverage:ignore-file
class CategoriesOperationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get code => text()();
  IntColumn get type => intEnum<OperationType>()();
}
