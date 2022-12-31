import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/create_expense/data/services/create_operation_service.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:flutter/material.dart';

class CreateOperationRepoImpl implements CreateOperationRepository {
  final CreateOpeartionService createOpeartionService;
  CreateOperationRepoImpl(this.createOpeartionService);

  @override
  Future<void> saveOperation({
    required String categoty,
    required double amount,
    required OperationType type,
    required DateTime dateTime,
  }) async {
    final operation = ItemOperationModel.create(
      category: categoty,
      amount: amount,
      type: type,
      dateOperation: dateTime,
    );
    try {
      await createOpeartionService.createOperation(operation);
      getIt<LastOperationesRepo>().addNewOperationes(operation);
    } catch (er, st) {
      debugPrint('$er\n$st');
      rethrow;
    }
  }
}
