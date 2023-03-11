import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../init_global.dart';
import '../../../../mock_data/models/balance_card_models.dart';

void main() {
  setupTests();

  /// Тest save newCard
  test('BalanceCardsService save new card test', () async {
    final service = getIt<BalanceCardsService>();
    var cards = await service.getAllCards();
    expect(cards.length, 0);
    await service.saveNewCard(mockBalanceModel);
    cards = await service.getAllCards();
    expect(cards.length, 1);
  });

  /// Test get all cards
  test('BalanceCardsService get all cards test', () async {
    final service = getIt<BalanceCardsService>();
    final cards = await service.getAllCards();
    expect([cards.first.name, cards.first.currencyId],
        [mockBalanceModel.name, mockBalanceModel.currencyId]);
  });

  /// Test get specific type currencies
  test('BalanceCardsService get crypto currencies test', () async {
    final service = getIt<BalanceCardsService>();
    final currencies = await service.getSpecificTypeCurrencies(1);
    expect(currencies.length, 100);
    expect(currencies.first.name, '1inch');
  });

  /// Test get item currency data
  test('BalanceCardsService get currency by ID test', () async {
    final service = getIt<BalanceCardsService>();
    final currency = await service.getItemCurrencyData(214);
    expect(currency.name, '1inch');
    expect(currency.type, 1);
  });

  /// Test get amount month operationes
  test('BalanceCardsService get amoun month operation test', () async {
    final service = getIt<BalanceCardsService>();
    final monthOperationModel = await service.getAmountMonthOperationes(
        DateTime.now(), mockBalanceModel.id);
    expect(monthOperationModel.income, 0.0);
    expect(monthOperationModel.expense, 0.0);
  });

  /// Test get item balance card by ID
  test('BalanceCardsService get item balance card test', () async {
    final service = getIt<BalanceCardsService>();
    final balanceModel = mockBalanceModelSecond;
    await service.saveNewCard(balanceModel);
    final dbBalanceModel =
        await service.getItemBalanceCardModel(balanceModel.id);
    expect(dbBalanceModel, balanceModel);
  });

  /// Test get currentBalanceCard
  test('BalanceCardsService get currentBalanceCardId test', () {
    final service = getIt<BalanceCardsService>();
    final result = service.currentBalanceCardId();
    expect(result, null);
  });

  test('BalanceCardsService saveCurrentBalanceCardId test', () {
    const cardId = '123455';
    final service = getIt<BalanceCardsService>();
    service.saveCurrentBalanceCardId(cardId);
    final result = service.currentBalanceCardId();
    expect(result, cardId);
  });
}
