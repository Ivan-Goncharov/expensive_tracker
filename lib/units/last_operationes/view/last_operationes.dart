import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_state.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final navState = BlocProvider.of<NavigatorCubit>(context).state
        as NavigationChangePageState;
    return BlocBuilder<LastOperationesCubit, LastOperationState>(
      builder: (context, state) {
        if (state is LastOperationLoadingState) {
          /// TODO: Реализовать нормальный загрузочный экран.
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LastOperationErrorState) {
          ///TODO: Реализовать красивую ошибку.
          return const Center(
            child: Text('Text Произошла ошибка'),
          );
        } else if (state is LastOperationLoadedState) {
          return ListView.builder(
            controller: navState.scrollController,
            itemBuilder: (context, index) => ListTile(
              title: Text('Title $index'),
            ),
            itemCount: 20,
          ); 
        } else {
          return const SizedBox();
        } 
      },
    );
  }
}
