import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/home/view/home_screen.dart';
import 'package:expensive_tracker_app/units/navigation/components/bottom_hide_bar.dart';
import 'package:expensive_tracker_app/units/navigation/components/float_button_visible.dart';
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
          return Scaffold(
            backgroundColor: colors.background,
            body: _pages[state.currentPage],
            floatingActionButton: FloatButtonVisible(
              widget: FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, createExpenseRoute),
                backgroundColor: colors.primary,
                foregroundColor: colors.background,
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: colors.background,
                  size: 28,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomHideBar(
              widget: BottomNavigationBar(
                elevation: 0,
                iconSize: 30,
                selectedIconTheme:
                    IconThemeData(color: colors.onSurfaceVariant, size: 40),
                backgroundColor: colors.background,
                currentIndex: state.currentPage,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: BlocProvider.of<NavigatorCubit>(context).changePage,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                    ),
                    label: 'Главная',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                    label: 'Настройки',
                  )
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
