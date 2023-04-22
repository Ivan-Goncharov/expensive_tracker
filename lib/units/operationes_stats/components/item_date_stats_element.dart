import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDateStatsElement extends StatelessWidget {
  final StatsDateType statsType;
  final bool isPadding;
  final String? title;
  const ItemDateStatsElement(
      {super.key, required this.statsType, this.isPadding = true, this.title});

  @override
  Widget build(BuildContext context) {
    final containerWidht = getTextSize(title ?? statsType.toLocale(), context);
    final currentCubitState =
        context.watch<ChangeStatsCubit>().state as ChangeStatsLoaded;
    final isSelect = currentCubitState.dateType == statsType;
    return Padding(
      padding: isPadding ? const EdgeInsets.only(right: 10) : EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.read<ChangeStatsCubit>().changeType(statsType),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title ?? statsType.toLocale()),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelect ? containerWidht : 0,
              height: 2,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  double getTextSize(String title, BuildContext context) {
    final textSpan =
        TextSpan(text: title, locale: Localizations.localeOf(context));
    final painter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
        maxWidth: double.infinity,
      );

    return painter.size.width;
  }
}
