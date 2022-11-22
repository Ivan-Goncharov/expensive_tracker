import 'package:drift/drift.dart';

class NoteOperation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text().named('operation_category')();
  TextColumn get type => text().named('operation_type')();
  DateTimeColumn get dateOperation => dateTime().named('operation_date')();
  RealColumn get amount => real().named('operation_amount')();
}
