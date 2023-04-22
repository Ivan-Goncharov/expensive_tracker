import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/components/item_category/view/item_category.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OperationCategoryWidget extends StatelessWidget {
  final List<CategoriesOperationTableData> listCategories;
  const OperationCategoryWidget(
    this.listCategories, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OperationCategoryCubit>()..initial(listCategories),
      child: const _OperationCategoryBody(),
    );
  }
}

class _OperationCategoryBody extends StatelessWidget {
  const _OperationCategoryBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationCategoryCubit, OperationCategoryState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state is OperationChangeCategoryState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (_, index) {
              return ItemCategory(
                  itemCategory: state.categories[index], index: index);
            },
            itemCount: state.categories.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
