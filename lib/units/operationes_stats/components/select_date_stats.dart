import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/widgets.dart';

class SelectDateStats extends StatelessWidget {
  const SelectDateStats({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _ItemElement(statsType: StatsDateType.today),
          _ItemElement(statsType: StatsDateType.yesterDay),
          _ItemElement(statsType: StatsDateType.thisWeek),
          _ItemElement(statsType: StatsDateType.month),
          _ItemElement(statsType: StatsDateType.year),
          _ItemElement(statsType: StatsDateType.allTime, isPadding: false),
        ],
      ),
    );
  }
}

class _ItemElement extends StatelessWidget {
  final StatsDateType statsType;
  final bool isPadding;
  const _ItemElement({required this.statsType, this.isPadding = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding ? const EdgeInsets.only(right: 10) : EdgeInsets.zero,
      child: Text(statsType.toLocale()),
    );
  }
}
