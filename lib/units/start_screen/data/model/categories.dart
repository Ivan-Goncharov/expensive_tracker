import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'categories.freezed.dart';

@freezed
class OperationCategories with _$OperationCategories {
  const OperationCategories._();

  factory OperationCategories({
    required String id,
    required String title,
    required String code,
    required OperationType type,
  }) = _OperationCategories;

  factory OperationCategories.create({
    required String title,
    required String code,
    required OperationType type,
  }) =>
      OperationCategories(
        id: const Uuid().v4(),
        title: title,
        code: code,
        type: type,
      );
}
