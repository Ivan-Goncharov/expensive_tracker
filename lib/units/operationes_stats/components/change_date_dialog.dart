import 'package:expensive_tracker_app/helpers/date_format_helpers.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

Future<void> changeDateDialog({
  required BuildContext context,
  required List<DateTime> dates,
  required Function(int index) changeDate,
  required DateTime currentDate,
  required StatsDateType statsDateType,
}) async {
  final colors = Theme.of(context).colorScheme;

  return SmartDialog.showAttach(
    targetContext: context,
    alignment: Alignment.bottomCenter,
    builder: (_) {
      return Material(
        color: colors.surfaceVariant,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            dates.length,
            (index) {
              final date = dates[index];

              bool isSelected = date == currentDate;
              return InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                onTap: () {
                  if (!isSelected) {
                    changeDate(index);
                  }
                  SmartDialog.dismiss();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormatHelper.dateTabBarFormat(
                      dateTime: dates[index],
                      context: context,
                      statsType: statsDateType,
                    ),
                    style: TextStyle(
                      color:
                          isSelected ? colors.primary : colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
