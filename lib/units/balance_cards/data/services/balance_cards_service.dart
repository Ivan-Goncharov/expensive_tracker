import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/app_db/key_value_storage.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

abstract class BalanceCardsService {
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard);

  Future<List<ItemBalanceCardModel>> getAllCards();

  Future<void> updateBalanceCardInfo(ItemBalanceCardModel balanceCard);
}

class BalanceCardServiceImpl implements BalanceCardsService {
  final KeyValueStorage _keyValueStorage;
  const BalanceCardServiceImpl(this._keyValueStorage);

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    final ids = await database.getAllBalanceCardIds();
    return _keyValueStorage.getAllCards(ids);
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
}
