import 'dart:collection';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/app_db/key_value_storage.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

abstract class BalanceCardsService {
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard);

  Future<List<ItemBalanceCardModel>> getAllCards();

  Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard);

  Future<HashMap<int, CurrencyData>> getAllUsedCurrency(HashSet<int> ids);

  Future<CurrencyData> getItemCurrencyData(int id);
}

class BalanceCardServiceImpl implements BalanceCardsService {
  final KeyValueStorage _keyValueStorage;
  const BalanceCardServiceImpl(this._keyValueStorage);

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    print('DEBUG GET CARDs');
    final ids = await database.getAllBalanceCardIds();
    print('DEBUG $ids');
    final data = await _keyValueStorage.getAllCards(ids);
    print('DEBUG DATA $data');
    return data;
  }

  @override
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard) async {
    await _keyValueStorage.saveNewCard(balanceCard);
    await database.addNewBalanceCard(BalanceCard(id: balanceCard.id));
  }

  @override
  Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard) {
    return _keyValueStorage.updateBalanceCardInfo(balanceCard);
  }

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
}
