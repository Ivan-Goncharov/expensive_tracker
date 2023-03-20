import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/error_or_loading.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/operations_stats_cubit.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/operations_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OperationesStatsView extends StatelessWidget {
  const OperationesStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OperationsStatsCubit>(
      create: (_) => getIt<OperationsStatsCubit>()..init(),
      child: const _OperationesStatsBody(),
    );
  }
}

class _OperationesStatsBody extends StatelessWidget {
  const _OperationesStatsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsStatsCubit, OperationsStatsState>(
      builder: (context, state) {
        if (state is OperationsStatsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OperationsStatsError) {
          return ErrorIconWithDescription(
            title: t.strings.error,
            iconData: FontAwesomeIcons.triangleExclamation,
          );
        } else {
          return const _SuccefulStateStats();
        }
      },
    );
  }
}

class _SuccefulStateStats extends StatelessWidget {
  const _SuccefulStateStats();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OperationsStatsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(cubit.balanceCard.name),
      ),
    );
  }
}


//  TextButton(
//                 child: const Text(
//                   'Create new card',
//                 ),
//                 onPressed: () =>
//                     Navigator.pushNamed(context, addNewBalanceCardRoute),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                   onPressed: () =>
//                       Navigator.pushNamed(context, settingsAppRoute),
//                   child: const Text('Open settings screen'))
//             ],