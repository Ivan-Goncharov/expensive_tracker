import 'package:expensive_tracker_app/helpers/extensions.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/item_operationes_view.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationesScroll extends StatelessWidget {
  final List<ItemOperationModel> operationes;
  const OperationesScroll(this.operationes, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final navState =
        context.read<NavigatorCubit>().state as NavigationChangePageState;
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      controller: navState.scrollController,
      itemBuilder: (_, index) =>
          ItemOperationView(operation: operationes[index]),
      itemCount: operationes.length,
      separatorBuilder: (_, index) {
        final currentOperation = operationes[index];
        if (index + 1 < operationes.length &&
            currentOperation.dateOperation.day !=
                operationes[index + 1].dateOperation.day) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              operationes[index + 1].dateOperation.formatToDateDivider(),
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Divider(
          height: 2,
          // color: Color(0xFF9E9E9E),
          color: colors.outlineVariant,
          endIndent: 0,
          indent: 0,
        );
      },
    );
  }
}
