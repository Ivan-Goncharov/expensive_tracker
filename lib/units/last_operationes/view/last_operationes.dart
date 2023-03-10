import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/error_or_loading.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/operationes_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LastOperationesView extends StatelessWidget {
  const LastOperationesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LastOperationesCubit>()..initial(),
      child: const _LastOperationesViewBody(),
    );
  }
}

class _LastOperationesViewBody extends StatelessWidget {
  const _LastOperationesViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastOperationesCubit, LastOperationState>(
      buildWhen: (_, current) {
        return true;
      },
      builder: (context, state) {
        if (state is LastOperationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LastOperationErrorState) {
          return const ErrorOrEmptyLastTransactions(
            title: SResources.error,
            iconData: FontAwesomeIcons.triangleExclamation,
          );
        } else if (state is LastOperationLoadedState) {
          return OperationesScroll(state.operations);
        } else if (state is LastOperationEmptyState) {
          return const ErrorOrEmptyLastTransactions(
            title: SResources.emptyList,
            iconData: FontAwesomeIcons.magnifyingGlassMinus,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
