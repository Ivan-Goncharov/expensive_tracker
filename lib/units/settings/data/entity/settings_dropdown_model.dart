import 'package:expensive_tracker_app/i18n/translations.g.dart';

class SettingsDropdownModel {
  final String title;
  final String? svgAsset;
  final int? iconCode;

  const SettingsDropdownModel({
    required this.title,
    this.svgAsset,
    this.iconCode,
  });
}

enum InterfaceLanguage {
  system,
  russian,
  english;

  String typeToLocale() {
    switch (this) {
      case InterfaceLanguage.system:
        return t.strings.system;
      case InterfaceLanguage.russian:
        return t.strings.russian; 
      case InterfaceLanguage.english:
        return t.strings.english;
    }
  }
}
