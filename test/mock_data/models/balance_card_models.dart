import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';

final mockBalanceModel = ItemBalanceCardModel.create(
  currencyId: 1,
  amount: 250,
  name: 'Mock card',
);

const mockInitialBalanceSecond = 1000.0;
final mockBalanceModelSecond = ItemBalanceCardModel.create(
  currencyId: 12,
  amount: mockInitialBalanceSecond,
  name: 'Mock card2',
);
