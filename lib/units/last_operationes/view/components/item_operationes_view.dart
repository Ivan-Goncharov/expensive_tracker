import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/opeation_amount.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/operation_icon.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/operation_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemOperationView extends StatelessWidget {
  final ItemOperationModel operation;
  const ItemOperationView({super.key, required this.operation});

  @override
  Widget build(BuildContext context) {
    final category = context
        .read<LastOperationesCubit>()
        .getCategoriesById(operation.category);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      width: double.infinity,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Иконка
          OperationIcon(category.getIconCode),
          const SizedBox(width: 20),

          /// Название категории и дата
          OperationTitle(operation.dateOperation, category.title),
          const Spacer(),

          /// Сколько потратил
          OperationAmount(operation),
        ],
      ),
    );
  }
}
