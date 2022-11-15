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
        // crossAxisAlignment: CrossAxisAlignment.end,
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
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'USD',
              style: TextStyle(fontSize: 20),
            ),
          ),
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
    BlocProvider.of<CreateOperationCubit>(context).changeAmount(amount);
  }
}
