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

  ItemBalanceCardModel get currentBalanceCard;

  MonthOperationAmountModel get operationAmountModel;

  Future<void> getOperationesMonthSumm(DateTime dateTime);

  bool addNewOperation(ItemOperationModel model);

  Future<void> getNewBalanceCardAmount(String id);

  List<ItemBalanceCardModel> get listOfCards;

  void clearData();
}
