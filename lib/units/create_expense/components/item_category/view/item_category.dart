import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategory extends StatefulWidget {
  final CategoryOperationModel itemCategory;
  const ItemCategory({super.key, required this.itemCategory});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  bool isPress = false;

  void pressToButton(BuildContext context) {
    if (!isPress) {
      setState(() => isPress = !isPress);
      BlocProvider.of<CreateOperationCubit>(context)
          .changeCategory(widget.itemCategory.title);
    }
  }

  // @override
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => pressToButton(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isPress ? colors.primary : colors.background,
          boxShadow: isPress
              ? []
              : [
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
              widget.itemCategory.icon,
              size: 26,
              color: isPress ? colors.onPrimary : colors.onBackground,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.itemCategory.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  color: isPress ? colors.onPrimary : colors.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
