import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/settings/components/dropdown_settings_menu.dart';
import 'package:expensive_tracker_app/units/settings/components/settings_element_item.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _items = [
  SettingsDropdownModel(
    title: t.strings.system,
    iconCode: FontAwesomeIcons.wrench.codePoint,
  ),
  SettingsDropdownModel(
    title: t.strings.russian,
    svgAsset: 'assets/flags/ru.svg',
  ),
  SettingsDropdownModel(
    title: t.strings.english,
    svgAsset: 'assets/flags/gb.svg',
  ),
];

class ChangeLanguageSettings extends StatelessWidget {
  const ChangeLanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SettingsCubit>();
    return InkWell(
      onTap: () => dropDownSettingsMenu(
        context: context,
        selectItem: (index) {
          cubit.changeLanguage(InterfaceLanguage.values[index]);
          SmartDialog.dismiss();
        },
        items: _items,
      ),
      child: SettingsElement(
        title: t.strings.language,
        backgroundColor: const Color(0xffE5D1FA),
        iconColor: const Color(0xff655DBB),
        iconData: FontAwesomeIcons.globe,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(cubit.language.typeToLocale()),
        ),
      ),
    );
  }
}
