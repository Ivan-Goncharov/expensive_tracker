import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../init_global.dart';

void main() {
  setupTests();

  const amount = 10.0;
  const name = 'Test name';
  const currencyId = 1;

  tearDownAll(() => getIt<BalanceCardRepo>().clearData());

  /// Тестирование saveNewCards
  test('Test save new cards BalanceCardsRepo', () async {
    final repo = getIt<BalanceCardRepo>();
    await repo.saveNewCard(
      name: name,
      amount: amount,
      currencyId: currencyId,
    );
    expect([repo.currentBalanceCard!.amount, repo.currentBalanceCard!.name],
        [amount, name]);
    expect(repo.listOfCards.length, 1);
  });

  // test('Test getOperationesMonthSumm BalanceCardsRepo ', () async {
  //   final repo = getIt<BalanceCardRepo>();
  //   await repo.getOperationesMonthSumm(
  //       DateTime(DateTime.now().year, DateTime.now().month), '');
  // });

  test('Test getAllCards BalanceCardsRepo', () async {
    final repo = getIt<BalanceCardRepo>();
    final listCards = await repo.getAllCards();
    final currentCard = repo.currentBalanceCard;
    expect(listCards.length, 1);
    expect([currentCard!.amount, currentCard.name], [amount, name]);
  });
}
