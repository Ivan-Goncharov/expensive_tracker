import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/settings/components/settings_element_item.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
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
    return InkWell(
      onTap: () => changeLanguageDialogShow(
        context: context,
        selectItem: () {
          SmartDialog.dismiss();
        },
        items: _items,
      ),
      child: SettingsElement(
        title: t.strings.language,
        backgroundColor: const Color(0xffE5D1FA),
        iconColor: const Color(0xff655DBB),
        iconData: FontAwesomeIcons.globe,
      ),
    );
  }
}

Future<void> changeLanguageDialogShow({
  required BuildContext context,
  required List<SettingsDropdownModel> items,
  required void Function() selectItem,
}) async {
  final colors = Theme.of(context).colorScheme;
  await SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      builder: (_) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.of(context).size.width,
          // ),
          child: Material(
            color: colors.background,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                items.length,
                (index) {
                  return InkWell(
                    onTap: SmartDialog.dismiss,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 6,
                          ),
                          child: Row(
                            children: [
                              _IconElement(items[index]),
                              const SizedBox(width: 8),
                              Text(
                                items[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index != items.length - 1) const Divider(height: 1),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      });
}

class _IconElement extends StatelessWidget {
  final SettingsDropdownModel item;
  const _IconElement(this.item);

  @override
  Widget build(BuildContext context) {
    final isIcon = item.iconCode != null;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            strokeAlign: BorderSide.strokeAlignOutside),
      ),
      width: isIcon ? null : 32,
      height: isIcon ? null : 32,
      alignment: Alignment.center,
      padding: isIcon ? const EdgeInsets.all(6) : null,
      child: item.iconCode != null
          ? Icon(
              IconDataSolid(item.iconCode!),
              size: 21,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SvgPicture.asset(
                item.svgAsset!,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
