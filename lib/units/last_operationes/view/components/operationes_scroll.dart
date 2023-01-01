import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/item_operationes_view.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class OperationesScroll extends StatelessWidget {
  final List<ItemOperationModel> operationes;
  const OperationesScroll(this.operationes, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final navState =
        context.read<NavigatorCubit>().state as NavigationChangePageState;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors.background,
          boxShadow: [
            const BoxShadow(
                color: Color(0xFF9E9E9E),
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: colors.onPrimary,
                offset: const Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        child: ListView.separated(
          controller: navState.scrollController,
          itemBuilder: (_, index) =>
              ItemOperationView(operation: operationes[index]),
          itemCount: operationes.length,
          separatorBuilder: (_, __) {
            return const Divider(height: 2, color: Color(0xFF9E9E9E));
          },
        ),
      ),
    );
  }
}
