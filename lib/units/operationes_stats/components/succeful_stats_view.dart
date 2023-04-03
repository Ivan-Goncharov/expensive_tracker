import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/error_or_loading.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/diagram_stats.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/select_date_stats.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccefulStatsView extends StatelessWidget {
  const SuccefulStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeStatsCubit, ChangeStatsState>(
      builder: (context, state) {
        if (state is ChangeStatsLoaded) { 
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SelectDateStats(),
              DiagramStats(
                summOfElement: state.summOfElement,
                operationes: state.operationes,
              ),
            ],
          );
        } else if (state is ChangeStatsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ErrorIconWithDescription(
            title: t.strings.error,
            iconData: Icons.error,
          );
        }
      },
    );
  }
}
