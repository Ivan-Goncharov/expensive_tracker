import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchOperation extends StatelessWidget {
  const SwitchOperation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleSwitch(
        minWidth: 120,
        totalSwitches: 2,
        initialLabelIndex: 0,
        inactiveBgColor: colors.background,
        borderColor: const [Colors.grey],
        borderWidth: 1,
        activeBgColor: [colors.primary],
        labels: const [
          SResources.expense,
          SResources.income,
        ],
        onToggle: (index) {
          BlocProvider.of<ChangeCategoriesCubit>(context).changeState(index!);
        },
      ),
    );
  }
}
