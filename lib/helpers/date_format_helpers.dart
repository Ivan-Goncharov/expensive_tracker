import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

abstract class DateFormatHelper {
  static String dateTabBarFormat({
    required DateTime dateTime,
    required BuildContext context,
    required StatsDateType statsType,
  }) {
    late intl.DateFormat format;
    final locale = Localizations.localeOf(context).languageCode;
    if (statsType == StatsDateType.month) {
      format = intl.DateFormat.MMMM(locale);
    } else {
      format = intl.DateFormat.y(locale);
    }
    return format.format(dateTime);
  }
}
