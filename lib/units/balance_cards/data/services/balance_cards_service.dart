import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

abstract class BalanceCardsService {
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard);

  Future<List<ItemBalanceCardModel>> getAllCards();

  /// Получение списка опредленного типа валют.
  /// [type] - тип валюты: 0 - обычная, 1 - крипта.
  Future<List<CurrencyData>> getSpecificTypeCurrencies(int type);

  /// Получение одной валюты по id
  /// [id] - id валюты.
  Future<CurrencyData> getItemCurrencyData(int id);

  /// Получение одной карты баланса.
  /// [id] - id данной карты.
  Future<ItemBalanceCardModel> getItemBalanceCardModel(String id);

  Future<MonthOperationAmountModel> getAmountMonthOperationes(
    DateTime dateTime,
    String cardId,
  );

  /// Получние id текущей карты.
  String? currentBalanceCardId();

  /// Сохранение id текущей карты.
  void saveCurrentBalanceCardId(String id);
}

class BalanceCardServiceImpl implements BalanceCardsService {
  late final AppDb _dbStorage;
  late final StorageProvider _storage;
  BalanceCardServiceImpl(StorageProvider provider) {
    _dbStorage = provider.database;
    _storage = provider;
  }

  @override
  Future<List<ItemBalanceCardModel>> getAllCards() async {
    return _dbStorage.getAllBalanceCards();
  }

  @override
  Future<void> saveNewCard(ItemBalanceCardModel balanceCard) async {
    await _dbStorage.addNewBalanceCard(balanceCard.toInsertable());
    _storage.prefs.put(PrefKeys.lastBalanceCardId, balanceCard.id);
  }

  @override
  Future<MonthOperationAmountModel> getAmountMonthOperationes(
      DateTime dateTime, String cardId) async {
    final data = await _dbStorage.getNotesOperation(dateTime, cardId);
    double income = 0.0;
    double expense = 0.0;
    for (final item in data) {
      if (item.type == OperationType.income) {
        income += item.amount;
      } else {
        expense += item.amount;
      }
    }
    return MonthOperationAmountModel(
        expense: expense, income: income, monthAndYear: dateTime);
  }

  @override
  Future<ItemBalanceCardModel> getItemBalanceCardModel(String id) {
    return _dbStorage.getItemBalanceCard(id);
  }

  @override
  Future<List<CurrencyData>> getSpecificTypeCurrencies(int type) async {
    return _dbStorage.getSpecificTypeCurrencies(type);
  }

  @override
  Future<CurrencyData> getItemCurrencyData(int id) {
    return _dbStorage.getItemCurrencyData(id);
  }

  @override
  String? currentBalanceCardId() =>
      _storage.prefs.get(PrefKeys.lastBalanceCardId) as String?;

  @override
  void saveCurrentBalanceCardId(String id) =>
      _storage.prefs.put(PrefKeys.lastBalanceCardId, id);
}
