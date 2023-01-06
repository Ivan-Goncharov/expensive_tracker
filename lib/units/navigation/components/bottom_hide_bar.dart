import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/navigation/components/cubits/bottom_hide_cubit/bottom_hide_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Виджет для скрывающегося нижнего бара навигации.
/// Принимает данный виджет навигации.
class BottomHideBar extends StatelessWidget {
  final Widget widget;
  const BottomHideBar({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final navState = BlocProvider.of<NavigatorCubit>(context).state
        as NavigationChangePageState;
    return BlocProvider(
      create: (_) =>
          getIt<BottomHideCubit>()..initial(navState.scrollController),
      child: _BottomHideBarBody(widget),
    );
  }
}

class _BottomHideBarBody extends StatelessWidget {
  final Widget widget;
  const _BottomHideBarBody(this.widget);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomHideCubit, BottomHideState>(
      builder: (context, state) {
        if (state is BottomHideChangeState) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: state.isHide
                ? 0
                : kBottomNavigationBarHeight +
                    MediaQuery.of(context).viewInsets.bottom +
                    30,
            margin: EdgeInsets.only(bottom: 16.0),
            child: Wrap(
              children: [widget],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
