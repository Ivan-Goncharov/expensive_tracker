import 'package:drift/drift.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

@UseRowClass(ItemBalanceCardModel, generateInsertable: true)
class BalanceCards extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get amount => real()();
  IntColumn get currencyId => integer()();
}
