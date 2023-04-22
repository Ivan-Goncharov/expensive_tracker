import 'package:expensive_tracker_app/helpers/date_format_helpers.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/change_date_dialog.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/item_date_stats_element.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// Виджет для вывода тех типов даты,
/// которые можно развернуть долгим тапом и выбрать дополнительные.
class LongPressDateType extends StatelessWidget {
  final List<DateTime> listOfDates;
  final DateTime currentSelectDate;

  final StatsDateType statsDateType;
  const LongPressDateType({
    super.key,
    required this.listOfDates,
    required this.currentSelectDate,
    required this.statsDateType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: listOfDates.length > 1
          ? () => changeDateDialog(
                context: context,
                dates: listOfDates,
                changeDate: (index) => changeDate(index, context),
                currentDate: currentSelectDate,
                statsDateType: statsDateType,
              )
          : null,
      child: ItemDateStatsElement(
        statsType: statsDateType,
        title: DateFormatHelper.dateTabBarFormat(
          dateTime: currentSelectDate,
          context: context,
          statsType: statsDateType,
        ),
      ),
    );
  }

  void changeDate(int index, BuildContext context) {
    final newDate = listOfDates[index];
    context
        .read<ChangeStatsCubit>()
        .changeType(statsDateType, dateTime: newDate);
  }
}
