import 'package:expensive_tracker_app/helpers/create_chart_helper.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramStats extends StatefulWidget {
  final Map<int, List<ItemOperationModel>> operationes;
  final int summOfElement;
  const DiagramStats({
    super.key,
    required this.operationes,
    required this.summOfElement,
  });

  @override
  State<DiagramStats> createState() => _DiagramStatsState();
}

class _DiagramStatsState extends State<DiagramStats> {
  int selectedItemId = -1;
  List<int> keys = [];

  @override
  Widget build(BuildContext context) {
    keys = widget.operationes.keys.toList();
    return Container(
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
        swapAnimationDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    ChangeStatsCubit cubit,
  ) {
    return List.generate(keys.length, (index) {
      final key = keys[index];
      final values = widget.operationes[key]!;
      return _pieChartSectionData(
        count: calculatePrecent(widget.summOfElement, values.length),
        color: generateByIdColor(cubit.getCategoriesById(key).id),
        isTouched: index == selectedItemId,
      );
    });
  }

  void touchCallback(FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
    setState(() {
      if (!event.isInterestedForInteractions ||
          pieTouchResponse == null ||
          pieTouchResponse.touchedSection == null) {
        selectedItemId = -1;
        return;
      }
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
