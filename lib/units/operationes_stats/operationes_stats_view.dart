import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/error_or_loading.dart';
import 'package:expensive_tracker_app/units/operationes_stats/components/succeful_stats_view.dart';
import 'package:expensive_tracker_app/units/operationes_stats/cubit/change_stats_cubit.dart';
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
        } else if (state is OperationsStatsLoaded) {
          final cubit = context.watch<OperationsStatsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.balanceCard.name),
            ),
            body: _OperationsStatsProvider(operations: state.listOperations),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _OperationsStatsProvider extends StatelessWidget {
  final List<ItemOperationModel> operations;
  const _OperationsStatsProvider({required this.operations});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangeStatsCubit>()..init(operations),
      child: const SuccefulStatsView(),
    );
  }
}
