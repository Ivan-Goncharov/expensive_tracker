import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/create_chart_helper.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/components/currency_symbol_view.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/operations_stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OperationesListStats extends StatelessWidget {
  final int? currentCategory;
  final double amountSpend;
  final Map<int, double> categorySpendMap;

  const OperationesListStats({
    super.key,
    required this.amountSpend,
    required this.categorySpendMap,
    this.currentCategory,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangeStatsCubit>();
    final category = currentCategory == null
        ? null
        : cubit.getCategoriesById(currentCategory!);
    final categoriesIdList = categorySpendMap.keys.toList();
    return Column(
      children: [
        _CurrentCategoryTitle(
          category,
          amountSpend,
        ),
        const Divider(),
        const SizedBox(height: 30),
        ...List.generate(categoriesIdList.length, (index) {
          final currentId = categoriesIdList[index];
          return Column(
            children: [
              _CurrentCategoryTitle(
                cubit.getCategoriesById(currentId),
                categorySpendMap[currentId]!,
              ),
              const Divider(indent: 35),
              const SizedBox(height: 8)
            ],
          );
        }),
      ],
    );
  }
}

class _CurrentCategoryTitle extends StatelessWidget {
  final CategoriesOperationTableData? category;
  final double amount;
  const _CurrentCategoryTitle(this.category, this.amount);

  @override
  Widget build(BuildContext context) {
    final color = category == null ? null : generateByIdColor(category!.id);
    return Row(
      children: [
        getIcon(color, category),
        const SizedBox(width: 10),
        Text(
          category?.title ?? t.strings.allCategories,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(amount.toStringAsFixed(1)),
        const SizedBox(width: 5),
        CurrencySymbolView(
            context.read<OperationsStatsCubit>().currencyData, 14),
      ],
    );
  }

  Widget getIcon(Color? color, CategoriesOperationTableData? category) {
    if (category == null) {
      return const FaIcon(FontAwesomeIcons.ban);
    } else {
      return Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        child: FaIcon(
          IconDataSolid(int.parse(category.code)),
          size: 20,
          color: color,
        ),
      );
    }
  }
}
