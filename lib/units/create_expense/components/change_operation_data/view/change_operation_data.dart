import 'package:expensive_tracker_app/units/create_expense/components/operation_category/view/operation_category.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/start_screen/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeOperationData extends StatelessWidget {
  const ChangeOperationData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCategoriesCubit, ChangeCategoriesState>(
      builder: (context, state) {
        if (state is CreateExpenseState) {
          return OperationCategoryWidget(
            getList(state),
            key: const ValueKey('Expense'),
          );
        } else if (state is CreateIncomeState) {
          return OperationCategoryWidget(
            getList(state),
            key: const ValueKey('Income'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  List<OperationCategories> getList(ChangeCategoriesState state) {
    if (state is CreateExpenseState) {
      return state.expenseCategory;
    } else if (state is CreateIncomeState) {
      return state.incomeCategory;
    } else {
      return [];
    }
  }
}
