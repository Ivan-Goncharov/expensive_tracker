import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:rxdart/rxdart.dart';

class BalanceCardsRepoImpl implements BalanceCardRepo {
  final BalanceCardsService _balanceCardService;
  BalanceCardsRepoImpl(this._balanceCardService);

  var _listOfCards = <ItemBalanceCardModel>[];
  late ItemBalanceCardModel _currentSelectCard;
  late MonthOperationAmountModel _operationAmountModel;
  final _balanceCardsController = BehaviorSubject<ItemBalanceCardModel>();

  @override
  ItemBalanceCardModel get currentBalanceCard => _currentSelectCard;
  @override
  MonthOperationAmountModel get operationAmountModel => _operationAmountModel;
  @override
  List<ItemBalanceCardModel> get listOfCards => _listOfCards;

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    _listOfCards = await _balanceCardService.getAllCards();

    _currentSelectCard = _listOfCards.first;
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
  Future<void> getOperationesMonthSumm(DateTime dateTime, String cardId) async {
    _operationAmountModel = await _balanceCardService.getAmountMonthOperationes(
        DateTime(dateTime.year, dateTime.month), cardId);
  }

  @override
  bool addNewOperation(ItemOperationModel operationModel) {
    final currentData = getIt<MonthRepositoty>().currentDate;

    // Если месяц и год добавленной операции не тот, что на экране - ничего не делаем
    if (currentData != null &&
        currentData.month != operationModel.dateOperation.month &&
        currentData.year != operationModel.dateOperation.year) {
      return false;
    }
    if (_currentSelectCard.id == operationModel.cardId) {
      if (operationModel.type == OperationType.expense) {
        _operationAmountModel = _operationAmountModel.copyWith(
            newExpense: _operationAmountModel.expense + operationModel.amount);
      } else {
        _operationAmountModel = _operationAmountModel.copyWith(
            newIncome: _operationAmountModel.income + operationModel.amount);
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> getNewBalanceCardAmount(String id) async {
    // Получаем карту по id c обновленными данными.
    final card = await _balanceCardService.getItemBalanceCardModel(id);
    // Если эта карта активная - обновляем значения активной карты.
    if (_currentSelectCard.id == id) _currentSelectCard = card;
    // Обновлеем элемент в списке.
    _listOfCards.removeWhere((card) => card.id == id);
    _listOfCards.add(card);
  }

  @override
  void addCardInStream(ItemBalanceCardModel card) {
    _balanceCardsController.add(card);
    _currentSelectCard = card;
  }

  @override
  Stream<ItemBalanceCardModel> cardIdStream() =>
      _balanceCardsController.asBroadcastStream();

  @override
  void clearData() {
    _listOfCards.clear();
  }
}
