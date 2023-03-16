import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_bloc.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/units/settings/components/change_language.dart';
import 'package:expensive_tracker_app/units/settings/components/settings_element_item.dart';
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
              t.strings.settings,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 20),

            /// Смена темы
            SettingsElement(
              title: t.strings.darkMode,
              backgroundColor: const Color(0xffE5D1FA),
              iconColor: const Color(0xff655DBB),
              iconData: FontAwesomeIcons.solidMoon,
              trailing: const _ThemeSwitcher(),
            ),

            /// Смена языка
            const ChangeLanguageSettings(),
          ],
        ),
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
