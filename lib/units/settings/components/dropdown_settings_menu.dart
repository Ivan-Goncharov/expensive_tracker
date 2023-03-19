import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Открытие всплывающего меню в настройках
/// [context] - Контекст того виджета, на котором был вызывано меню
/// [items] - список [SettingsDropdownModel], которые необходимо отрисовать
/// [selectItem] - функция, которая должна вызваться при нажатии на элемент
Future<void> dropDownSettingsMenu({
  required BuildContext context,
  required List<SettingsDropdownModel> items,
  required void Function(int index) selectItem,
}) async {
  final colors = Theme.of(context).colorScheme;
  await SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      builder: (_) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          width: MediaQuery.of(context).size.width,
          // ),
          child: Material(
            color: colors.surfaceVariant,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                items.length,
                (index) {
                  return InkWell(
                    onTap: () => selectItem(index),
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
                              const SizedBox(width: 16),
                              Text(
                                items[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: colors.onSurfaceVariant,
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
            color: Theme.of(context).colorScheme.onSurfaceVariant,
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
