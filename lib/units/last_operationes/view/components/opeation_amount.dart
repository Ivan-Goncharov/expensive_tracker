import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:flutter/material.dart';

class OperationAmount extends StatelessWidget {
  final ItemOperationModel operation;
  const OperationAmount(this.operation, {super.key});

  @override
  Widget build(BuildContext context) {
    if (operation.type == OperationType.income) {
      return Text(
        '-\$${operation.amount}',
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        '+\$${operation.amount}',
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
