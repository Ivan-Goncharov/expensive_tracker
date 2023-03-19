import 'package:expensive_tracker_app/helpers/extensions.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_bloc.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/units/settings/components/dropdown_settings_menu.dart';
import 'package:expensive_tracker_app/units/settings/components/settings_element_item.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _items = [
  SettingsDropdownModel(
    title: ThemesState.system.typeToLocale(),
    iconCode: FontAwesomeIcons.wrench.codePoint,
  ),
  SettingsDropdownModel(
    title: ThemesState.dark.typeToLocale(),
    iconCode: FontAwesomeIcons.solidMoon.codePoint,
  ),
  SettingsDropdownModel(
    title: ThemesState.light.typeToLocale(),
    iconCode: FontAwesomeIcons.sun.codePoint,
  ),
];

class ChangeThemeView extends StatelessWidget {
  const ChangeThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemesBloc>();
    return InkWell(
      onTap: () => dropDownSettingsMenu(
        context: context,
        selectItem: (index) {
          bloc.add(ThemesState.values[index]);
          SmartDialog.dismiss();
        },
        items: _items,
      ),
      child: SettingsElement(
        title: t.strings.appTheme,
        backgroundColor: const Color(0xffE5D1FA),
        iconColor: const Color(0xff655DBB),
        iconData: context.isDarkMode
            ? FontAwesomeIcons.solidMoon
            : FontAwesomeIcons.solidSun,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(bloc.state.typeToLocale()),
        ),
      ),
    );
  }
}
