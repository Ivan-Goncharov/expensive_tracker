import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/services/create_operation_service.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class CreateOperationRepoImpl implements CreateOperationRepository {
  final CreateOpeartionService _createOpeartionService;
  CreateOperationRepoImpl(this._createOpeartionService);

  final _newOperationController = BehaviorSubject<ItemOperationModel>();

  @override
  Future<void> saveOperation({
    required int categoty,
    required double amount,
    required OperationType type,
    required DateTime dateTime,
    required String cardId,
  }) async {
    final operation = ItemOperationModel.create(
      category: categoty,
      amount: amount,
      type: type,
      dateOperation: dateTime,
      cardId: cardId,
    );
    try {
      await _createOpeartionService.createOperation(operation);
      _newOperationController.add(operation);
    } catch (er, st) {
      debugPrint('$er\n$st');
      rethrow;
    }
  }

  @override
  Stream<ItemOperationModel> getNewOperation() =>
      _newOperationController.asBroadcastStream();
}
