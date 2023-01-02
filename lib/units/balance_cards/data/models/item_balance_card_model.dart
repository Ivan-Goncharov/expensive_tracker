import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'item_balance_card_model.freezed.dart';
part 'item_balance_card_model.g.dart';

@freezed
class ItemBalanceCardModel with _$ItemBalanceCardModel {
  const ItemBalanceCardModel._();

  factory ItemBalanceCardModel({
    required String id,
    required String name,
    required double amount,
  }) = _ItemBalanceCard;

  factory ItemBalanceCardModel.create({
    required String name,
    double amount = 0.0,
  }) =>
      ItemBalanceCardModel(
        id: const Uuid().v4(),
        name: name,
        amount: amount,
      );

  factory ItemBalanceCardModel.fromJson(Map<String, dynamic> json) =>
      _$ItemBalanceCardModelFromJson(json);
}
