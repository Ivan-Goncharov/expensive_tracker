import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:rxdart/rxdart.dart';

class BalanceCardsRepoImpl implements BalanceCardRepo {
  final BalanceCardsService _balanceCardService;
  BalanceCardsRepoImpl(this._balanceCardService);

  var _listOfCards = <ItemBalanceCardModel>[];
  ItemBalanceCardModel? _currentSelectCard;
  final _balanceCardsController = BehaviorSubject<ItemBalanceCardModel>();

  @override
  ItemBalanceCardModel? get currentBalanceCard => _currentSelectCard;
  @override
  List<ItemBalanceCardModel> get listOfCards => _listOfCards;

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    /// Получаем список всех карт и текущую выбранную карту
    _listOfCards = await _balanceCardService.getAllCards();
    final currentCardID = _balanceCardService.currentBalanceCardId();

    if (currentCardID != null) {
      /// Если id текущей карты сохранен - работаем с ней
      _currentSelectCard =
          _listOfCards.firstWhere((element) => element.id == currentCardID);
    } else if (_listOfCards.isNotEmpty) {
      /// Иначе выбираем первую карту из списка и работаем с ней
      _currentSelectCard = _listOfCards.first;
      _balanceCardService.saveCurrentBalanceCardId(_currentSelectCard!.id);
    }
    return _listOfCards;
  }

  @override
  Future<void> saveNewCard({
    required String name,
    required double amount,
    required int currencyId,
  }) async {
    final card = ItemBalanceCardModel.create(
      name: name,
      amount: amount,
      currencyId: currencyId,
    );
    await _balanceCardService.saveNewCard(card);
    _listOfCards.add(card);
    _currentSelectCard = card;
  }

  @override
  Future<MonthOperationAmountModel> getOperationesMonthSumm(
    DateTime dateTime,
    String cardId,
  ) =>
      _balanceCardService.getAmountMonthOperationes(
        DateTime(dateTime.year, dateTime.month),
        cardId,
      );

  @override
  void addCardInStream(ItemBalanceCardModel card) {
    _balanceCardsController.add(card);
    _currentSelectCard = card;
    _balanceCardService.saveCurrentBalanceCardId(card.id);
  }

  @override
  Stream<ItemBalanceCardModel> cardIdStream() =>
      _balanceCardsController.asBroadcastStream();

  @override
  void changeAmountBalanceCard(ItemOperationModel operation) {
    final index =
        _listOfCards.indexWhere((card) => card.id == operation.cardId);
    var card = _listOfCards[index];
    var newAmount = operation.type == OperationType.expense
        ? card.amount - operation.amount
        : card.amount + operation.amount;

    card = card.copyWith(amount: newAmount);
    _listOfCards[index] = card;
    if (_currentSelectCard!.id == card.id) {
      _currentSelectCard = card;
    }
  }

  @override
  void clearData() {
    _listOfCards.clear();
  }
}
