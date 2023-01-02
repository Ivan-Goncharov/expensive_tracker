import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';

class BalanceCardsRepoImpl implements BalanceCardRepo {
  final BalanceCardsService _balanceCardService;
  BalanceCardsRepoImpl(this._balanceCardService);

  var _listOfCards = <ItemBalanceCardModel>[];

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    _listOfCards = await _balanceCardService.getAllCards();
    return _listOfCards;
  }

  @override
  Future<void> saveNewCard(
      {required String name, required double amount}) async {
    final card = ItemBalanceCardModel.create(name: name, amount: amount);
    await _balanceCardService.saveNewCard(card);
    _listOfCards.add(card);
  }

  @override
  Future<void> updateBalanceCardInfo({
    required String id,
    String? name,
    double? amount,
  }) async {
    var card = _listOfCards.firstWhere((element) => element.id == id);
    card = card.copyWith(
      name: name ?? card.name,
      amount: amount ?? card.amount,
    );
    _balanceCardService.updateBalanceCardInfo(card);
    _listOfCards.removeWhere((element) => element.id == id);
    _listOfCards.add(card);
  }
}
