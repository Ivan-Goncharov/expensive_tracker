import 'package:equatable/equatable.dart';
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
  }) = _ItemOperationModel;

  /// Создание операции
  factory ItemOperationModel.create({
    required String category,
    required double amount,
    required OperationType type,
    required DateTime dateOperation,
  }) =>
      ItemOperationModel(
        id: const Uuid().v4(),
        category: category,
        amount: amount,
        type: type,
        dateOperation: dateOperation,
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
