import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class BalanceCardRepo {
  Future<void> saveNewCard({
    required String name,
    required double amount,
    required int currencyId,
  });

  Future<List<ItemBalanceCardModel>> getAllCards();

  ItemBalanceCardModel? get currentBalanceCard;

  Future<MonthOperationAmountModel> getOperationesMonthSumm(
      DateTime dateTime, String cardID);

  List<ItemBalanceCardModel> get listOfCards;

  void addCardInStream(ItemBalanceCardModel card);

  void changeAmountBalanceCard(ItemOperationModel operation);

  Stream<ItemBalanceCardModel> cardIdStream();

  void clearData();
}
