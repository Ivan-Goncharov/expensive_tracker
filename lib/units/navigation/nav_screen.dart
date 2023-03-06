import 'package:expensive_tracker_app/units/operationes_stats/operationes_stats_view.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/home/view/home_screen.dart';
import 'package:expensive_tracker_app/units/navigation/components/bottom_hide_bar.dart';

import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Главный виджет с навигацией по приложению
class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NavigatorCubit>()..initial(),
      child: const _NavScreenBody(),
    );
  }
}

final _pages = [
  const HomeScreen(),
  const OperationesStatsView(),
];

class _NavScreenBody extends StatelessWidget {
  const _NavScreenBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<NavigatorCubit, NavigationState>(
      builder: (context, state) {
        if (state is NavigationChangePageState) {
          return Scaffold(
            backgroundColor: colors.background,
            body: _pages[state.currentPage],
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, createExpenseRoute),
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: colors.onPrimaryContainer,
                size: 30,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomHideBar(
              widget: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                enableFeedback: false,
                elevation: 0,
                selectedIconTheme:
                    IconThemeData(color: colors.primary, size: 30),
                unselectedItemColor: colors.onSurface,
                backgroundColor: colors.background,
                currentIndex: state.currentPage,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: context.watch<NavigatorCubit>().changePage,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                    ),
                    label: 'Main',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.chartSimple,
                    ),
                    label: 'Statistic',
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
