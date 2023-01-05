import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class BalanceCardsService {
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard);

  Future<List<ItemBalanceCardModel>> getAllCards();

  // Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard);

  Future<HashMap<int, CurrencyData>> getAllUsedCurrency(HashSet<int> ids);

  Future<CurrencyData> getItemCurrencyData(int id);

  /// Получение одной карты баланса.
  /// [id] - id данной карты.
  Future<ItemBalanceCardModel> getItemBalanceCardModel(String id);

  Future<MonthOperationAmountModel> getAmountMonthOperationes(
      DateTime dateTime);
}

class BalanceCardServiceImpl implements BalanceCardsService {
  const BalanceCardServiceImpl();

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    return database.getAllBalanceCards();
  }

  @override
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard) async {
    await database.addNewBalanceCard(balanceCard.toInsertable());
  }

  // @override
  // Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard) async {
  //   /// TODO: Реализовать обновление, если потребуется.
  // }

  @override
  Future<HashMap<int, CurrencyData>> getAllUsedCurrency(
      HashSet<int> ids) async {
    final map = HashMap<int, CurrencyData>();
    for (final id in ids) {
      final currency = await database.getItemCurrencyData(id);
      map[currency.id] = currency;
    }
    return map;
  }

  @override
  Future<CurrencyData> getItemCurrencyData(int id) {
    return database.getItemCurrencyData(id);
  }

  @override
  Future<MonthOperationAmountModel> getAmountMonthOperationes(
      DateTime dateTime) async {
    final data = await database.getNotesOperation(dateTime);
    double income = 0.0;
    double expense = 0.0;
    for (final item in data) {
      if (item.type == OperationType.income) {
        income += item.amount;
      } else {
        expense += item.amount;
      }
    }
    return MonthOperationAmountModel(expense: expense, income: income);
  }

  @override
  Future<ItemBalanceCardModel> getItemBalanceCardModel(String id) {
    return database.getItemBalanceCard(id);
  }
}
