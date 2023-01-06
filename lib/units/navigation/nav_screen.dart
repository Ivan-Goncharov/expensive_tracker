import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/home/view/home_screen.dart';
import 'package:expensive_tracker_app/units/navigation/components/bottom_hide_bar.dart';

import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:expensive_tracker_app/units/settings/view/settings_screen.dart';
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
  const SizedBox(),
  const SizedBox(),
  const SettingsScreen(),
];

class _NavScreenBody extends StatelessWidget {
  const _NavScreenBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<NavigatorCubit, NavigationState>(
      builder: (context, state) {
        if (state is NavigationChangePageState) {
          print('DEBUG STAET ${state.listOfCards}');
          return Scaffold(
            backgroundColor: colors.background,
            body: _pages[state.currentPage],
            // floatingActionButton: const FabButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: BottomHideBar(
              widget: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                iconSize: 30,
                selectedIconTheme:
                    IconThemeData(color: colors.onSurfaceVariant, size: 40),
                unselectedItemColor: const Color(0xFF6F6F6F),
                backgroundColor: colors.background,
                currentIndex: state.currentPage,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: ((value) {
                  if (value != 1 && value != 4) {
                    BlocProvider.of<NavigatorCubit>(context).changePage(value);
                  }
                }),
                items: [
                  const BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                    ),
                    label: 'Main',
                  ),
                  const BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.chartSimple,
                    ),
                    label: 'Statistic',
                  ),
                  BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, createExpenseRoute),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 8.0),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: colors.primary, shape: BoxShape.circle),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colors.background,
                        ),
                      ),
                    ),
                    label: 'Настройки',
                  ),
                  const BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                    label: 'Settings',
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
