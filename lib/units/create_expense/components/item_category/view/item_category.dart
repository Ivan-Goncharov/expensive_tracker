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
      // alignment: Alignment.center,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors.background,
        boxShadow: [
          const BoxShadow(
              color: Color(0xFF9E9E9E),
              offset: Offset(2.0, 2.0),
              blurRadius: 6.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: colors.onPrimary,
              offset: const Offset(-2.0, -2.0),
              blurRadius: 6.0,
              spreadRadius: 1.0),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            itemCategory.icon,
            size: 26,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            itemCategory.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
