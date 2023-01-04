import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

abstract class BalanceCardRepo {
  Future<void> saveNewCard({
    required String name,
    required double amount,
    required int currencyId,
  });

  Future<List<ItemBalanceCardModel>> getAllCards();

  ItemBalanceCardModel get currentBalanceCard;

  Future<CurrencyData> getCurrencyDataById(int id);

  Future<void> updateBalanceCardInfo({
    required String id,
    String? name,
    double? amount,
    int? currencyId,
  });
}
