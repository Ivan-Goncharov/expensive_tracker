import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemCategory extends StatelessWidget {
  final CategoryOperationModel itemCategory;
  const ItemCategory({super.key, required this.itemCategory});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 80,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(itemCategory.icon),
          Text(itemCategory.title),
        ],
      ),
    );
  }
}
