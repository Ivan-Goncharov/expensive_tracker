import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCategory extends StatelessWidget {
  final CategoriesOperationTableData itemCategory;
  final int index;
  const ItemCategory(
      {super.key, required this.itemCategory, required this.index});

  // @override
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final oprationCategoryBloc = context.watch<OperationCategoryCubit>();
    final selectIndex =
        (oprationCategoryBloc.state as OperationChangeCategoryState)
            .indexOfSelect;
    return GestureDetector(
      onTap: () => oprationCategoryBloc.changeCategory(index, context),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
                  selectIndex == index ? colors.primary : colors.surfaceVariant,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconDataSolid(int.parse(itemCategory.code)),
                  color: selectIndex == index
                      ? colors.onPrimary
                      : colors.onBackground,
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
                      fontSize: 10,
                      color: selectIndex == index
                          ? colors.onPrimary
                          : colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
