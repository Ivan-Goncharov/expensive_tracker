import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'item_balance_card_model.freezed.dart';
part 'item_balance_card_model.g.dart';
// coverage:ignore-file
@freezed
class ItemBalanceCardModel with _$ItemBalanceCardModel {
  const ItemBalanceCardModel._();

  factory ItemBalanceCardModel({
    required String id,
    required String name,
    required double amount,
    required int currencyId,
  }) = _ItemBalanceCard;

  factory ItemBalanceCardModel.create({
    required String name,
    double amount = 0.0,
    required int currencyId,
  }) =>
      ItemBalanceCardModel(
        id: const Uuid().v4(),
        name: name,
        amount: amount,
        currencyId: currencyId,
      );

  factory ItemBalanceCardModel.fromJson(Map<String, dynamic> json) =>
      _$ItemBalanceCardModelFromJson(json);
}
