import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'item_operation_model.freezed.dart';

@freezed
class ItemOperationModel with _$ItemOperationModel {
  const ItemOperationModel._();
  factory ItemOperationModel({
    required String id,
    required String category,
    required double amount,
    required OperationType type,
    required DateTime dateOperation,
    required String cardId,
  }) = _ItemOperationModel;

  /// Создание операции
  factory ItemOperationModel.create({
    required String category,
    required double amount,
    required OperationType type,
    required DateTime dateOperation,
    required String cardId,
  }) =>
      ItemOperationModel(
        id: const Uuid().v4(),
        category: category,
        amount: amount,
        type: type,
        dateOperation: dateOperation,
        cardId: cardId,
      );

  /// Изменение операции
  ItemOperationModel edit({
    String? category,
    double? amount,
    OperationType? type,
    DateTime? dateOperation,
  }) =>
      copyWith(
        category: category ?? this.category,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        dateOperation: dateOperation ?? this.dateOperation,
      );
}

enum OperationType {
  income,
  expense,
}
