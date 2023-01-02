import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

abstract class BalanceCardRepo {
  Future<void> saveNewCard({required String name, required double amount});

  Future<List<ItemBalanceCardModel>> getAllCards();

  Future<void> updateBalanceCardInfo(
      {required String id, String? name, double? amount});
}
