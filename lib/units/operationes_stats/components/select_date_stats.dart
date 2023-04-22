import 'package:expensive_tracker_app/units/operationes_stats/components/item_date_stats_element.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/long_press_date_type.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDateStats extends StatelessWidget {
  const SelectDateStats({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChangeStatsCubit>().state as ChangeStatsLoaded;

    return Container(
      height: 30,
      alignment: Alignment.topLeft,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const ItemDateStatsElement(statsType: StatsDateType.today),
          const ItemDateStatsElement(statsType: StatsDateType.yesterDay),
          const ItemDateStatsElement(statsType: StatsDateType.thisWeek),
          LongPressDateType(
            listOfDates: state.listOfMonthStats,
            currentSelectDate: state.currentStatsMonth,
            statsDateType: StatsDateType.month,
          ),
          LongPressDateType(
            listOfDates: state.listOfYearStats,
            currentSelectDate: state.currentStatsYear,
            statsDateType: StatsDateType.year,
          ),
          const ItemDateStatsElement(
            statsType: StatsDateType.allTime,
            isPadding: false,
          ),
        ],
      ),
    );
  }
}
