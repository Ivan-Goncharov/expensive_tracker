import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCategory extends StatelessWidget {
  final OperationCategories itemCategory;
  final int index;
  const ItemCategory(
      {super.key, required this.itemCategory, required this.index});

  // @override
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // final changeCategoryCubit =
    //     BlocProvider.of<OperationCategoryCubit>(context);
    final selectIndex = (BlocProvider.of<OperationCategoryCubit>(context).state
            as OperationChangeCategoryState)
        .indexOfSelect;
    return GestureDetector(
      onTap: () => BlocProvider.of<OperationCategoryCubit>(context)
          .changeCategory(index, context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectIndex == index ? colors.primary : colors.background,
          boxShadow: selectIndex == index
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
              IconDataSolid(itemCategory.getIconCode),
              size: 26,
              color:
                  selectIndex == index ? colors.onPrimary : colors.onBackground,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              itemCategory.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  color: selectIndex == index
                      ? colors.onPrimary
                      : colors.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
