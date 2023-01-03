import 'package:drift/drift.dart';

class Currency extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get symbol => text()();
  IntColumn get type => integer()();
}
