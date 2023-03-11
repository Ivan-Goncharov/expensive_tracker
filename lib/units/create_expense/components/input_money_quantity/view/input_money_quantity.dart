import 'package:expensive_tracker_app/units/components/currency_symbol_view.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputMoneyQuantity extends StatelessWidget {
  const InputMoneyQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onChanged: (value) => _changeAmount(context, value),
            ),
          ),
          const _CurrencySymbolBuilder(),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(FontAwesomeIcons.calculator),
          )
        ],
      ),
    );
  }

  void _changeAmount(BuildContext context, String value) {
    var amount = 0.0;
    if (value.isNotEmpty) {
      amount = double.parse(value);
    }
    context.read<CreateOperationCubit>().changeAmount(amount);
  }
}

class _CurrencySymbolBuilder extends StatelessWidget {
  const _CurrencySymbolBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOperationCubit, CreateOperationState>(
      builder: (context, state) {
        if (state is CreateOperationLoading) {
          return const CircularProgressIndicator();
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CurrencySymbolView(
              context.read<CreateOperationCubit>().currencyData,
              20,
            ),
          );
        }
      },
    );
  }
}
