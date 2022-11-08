import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';
import 'package:expensive_tracker_app/units/create_expense/components/item_category/view/item_category.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OperationCategoryWidget extends StatelessWidget {
  const OperationCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final operationState = BlocProvider.of<ChangeCategoriesCubit>(context).state;

    return BlocProvider(
      create: (_) =>
          getIt<OperationCategoryCubit>()..initial(getList(operationState)),
      child: const _OperationCategoryBody(),
    );
  }

  List<CategoryOperationModel> getList(ChangeCategoriesState state) {
    if (state is CreateExpenseState) {
      return state.expenseCategory;
    } else if (state is CreateIncomeState) {
      return state.incomeCategory;
    } else {
      return [];
    }
  }
}

class _OperationCategoryBody extends StatelessWidget {
  const _OperationCategoryBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationCategoryCubit, OperationCategoryState>(
      builder: (context, state) {
        if (state is OperationCategoryInitState) {
          return Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (_, index) {
                return ItemCategory(itemCategory: state.categories[index]);
              },
              itemCount: state.categories.length,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
