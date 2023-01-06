import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/navigation/components/cubits/float_button_hide_cubit/cubit/float_button_vis_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatButtonVisible extends StatelessWidget {
  final Widget widget;
  const FloatButtonVisible({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final navState = BlocProvider.of<NavigatorCubit>(context).state
        as NavigationChangePageState;
    return BlocProvider(
      create: (_) =>
          getIt<FloatButtonVisCubit>()..initial(navState.scrollController),
      child: _FloatButtonVisibleBody(widget: widget),
    );
  }
}

class _FloatButtonVisibleBody extends StatelessWidget {
  final Widget widget;
  const _FloatButtonVisibleBody({required this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatButtonVisCubit, FloatButtonVisState>(
      builder: (context, state) {
        if (state is FloatButtonVisChangeState) {
          return AnimatedOpacity(
            opacity: state.isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              // padding: const EdgeInsets.only(top: 700),

              child: widget,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
