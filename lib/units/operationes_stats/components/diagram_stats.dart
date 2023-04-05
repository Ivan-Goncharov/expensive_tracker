import 'package:expensive_tracker_app/helpers/create_chart_helper.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/operationes_list_stats.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/data/entity/stats_model_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramStats extends StatefulWidget {
  final StatsModel statsModel;
  const DiagramStats({
    super.key,
    required this.statsModel,
  });

  @override
  State<DiagramStats> createState() => _DiagramStatsState();
}

class _DiagramStatsState extends State<DiagramStats> {
  int selectedItemId = -1;
  List<int> keys = [];

  @override
  void didUpdateWidget(covariant DiagramStats oldWidget) {
    selectedItemId = -1;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    keys = widget.statsModel.mapOfOperationes.keys.toList();
    final currentId = selectedItemId == -1 ? null : keys[selectedItemId];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: touchCallback,
                enabled: false,
              ),
              sections: showingSections(context.watch<ChangeStatsCubit>()),
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 30,
              sectionsSpace: 1,
            ),
            swapAnimationDuration: const Duration(milliseconds: 200),
          ),
        ),
        OperationesListStats(
          currentCategory: currentId,
          amountSpend: currentId == null
              ? widget.statsModel.totalSpend
              : widget.statsModel.categorySpendMap[currentId]!,
          categorySpendMap: widget.statsModel.categorySpendMap,
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections(
    ChangeStatsCubit cubit,
  ) {
    return List.generate(keys.length, (index) {
      final key = keys[index];
      return _pieChartSectionData(
        count: calculatePrecent(
          widget.statsModel.totalSpend,
          widget.statsModel.categorySpendMap[key] ?? 0.0,
        ),
        color: generateByIdColor(cubit.getCategoriesById(key).id),
        isTouched: index == selectedItemId,
      );
    });
  }

  /// Перестраиваем экран только, если нажали на другой элемент
  void touchCallback(FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
    if (pieTouchResponse == null) {
      setState(() => selectedItemId = -1);
      return;
    }
    final touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
    if (touchedIndex == selectedItemId) return;
    setState(() {
      selectedItemId = pieTouchResponse.touchedSection!.touchedSectionIndex;
    });
  }

  PieChartSectionData _pieChartSectionData(
      {required int count, required Color color, required bool isTouched}) {
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 60.0 : 50.0;
    return PieChartSectionData(
      value: count.toDouble(),
      color: color,
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
