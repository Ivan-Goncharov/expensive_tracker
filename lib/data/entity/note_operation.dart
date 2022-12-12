import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

@UseRowClass(ItemOperationModel, generateInsertable: true)
class NoteOperation extends Table {
  TextColumn get id => text().named('id')();
  TextColumn get category => text().named('operation_category')();
  IntColumn get type => intEnum<OperationType>()();
  DateTimeColumn get dateOperation => dateTime().named('operation_date')();
  RealColumn get amount => real().named('operation_amount')();
}
