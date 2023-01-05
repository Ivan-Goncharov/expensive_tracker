import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

abstract class KeyValueStorage {
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard);

  Future<List<ItemBalanceCardModel>> getAllCards(List<BalanceCard> ids);

  Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard);
}

class KeyValueStorageImpl implements KeyValueStorage {
  @override
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard) async {
    final box = await Hive.openBox('cards');
    await box.put(balanceCard.id, balanceCard.toJson());
  }

  @override
  Future<List<ItemBalanceCardModel>> getAllCards(List<BalanceCard> ids) async {
    final list = <ItemBalanceCardModel>[];
    final box = await Hive.openBox('cards');
    for (final item in ids) {
      list.add(ItemBalanceCardModel.fromJson(
          Map<String, dynamic>.from(box.get(item.id))));
    }
    return list;
  }

  @override
  Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard) async {
    final box = await Hive.openBox('cards');
    box.put(balanceCard.id, balanceCard.toJson());
  }
}
