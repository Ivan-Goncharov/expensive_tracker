import 'package:expensive_tracker_app/units/components/currency_symbol_view.dart';
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
    final isIncome = operation.type == OperationType.income;
    final color = isIncome ? Colors.green : Colors.red;

    return Row(
      children: [
        Text(
          isIncome ? '+' : '-',
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 2),
        CurrencySymbolView(currency, 14, titleColor: color),
        const SizedBox(width: 2),
        Text(
          operation.amount.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
