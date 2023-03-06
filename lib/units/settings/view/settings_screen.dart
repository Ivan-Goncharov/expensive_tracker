import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_bloc.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.background,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// Заголовок
            Text(
              SResources.settings,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 20),

            /// Смена темы
            const _SettingsElement(
              title: SResources.darkMode,
              backgroundColor: Color(0xffE5D1FA),
              iconColor: Color(0xff655DBB),
              iconData: FontAwesomeIcons.solidMoon,
              trailing: _ThemeSwitcher(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsElement extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconData;
  final Widget? trailing;
  const _SettingsElement({
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    required this.iconData,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(
              iconData,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: colors.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          trailing ?? const SizedBox()
        ],
      ),
    );
  }
}

class _ThemeSwitcher extends StatelessWidget {
  const _ThemeSwitcher();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bloc = context.watch<ThemesBloc>();
    return CupertinoSwitch(
        value: isDarkMode,
        onChanged: (value) {
          if (value) {
            bloc.add(ThemesState.dark);
          } else {
            bloc.add(ThemesState.light);
          }
        });
  }
}
