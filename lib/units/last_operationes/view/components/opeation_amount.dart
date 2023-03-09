import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationAmount extends StatelessWidget {
  final ItemOperationModel operation;
  const OperationAmount(this.operation, {super.key});

  @override
  Widget build(BuildContext context) {
    final currency =
        (context.read<LastOperationesCubit>().state as LastOperationLoadedState)
            .currencyData;

    if (operation.type == OperationType.income) {
      return Text(
        '+${currency.symbol}${operation.amount}',
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
