import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:flutter/material.dart';

enum ThemesState {
  system,
  dark,
  light;

  String typeToLocale() {
    switch (this) {
      case ThemesState.light:
        return t.strings.lightMode;
      case ThemesState.dark:
        return t.strings.darkMode;
      case ThemesState.system:
        return t.strings.system;
    }
  }

  ThemeMode getThemeMode() {
    switch (this) {
      case ThemesState.light:
        return ThemeMode.light;
      case ThemesState.dark:
        return ThemeMode.dark;
      case ThemesState.system:
        return ThemeMode.system;
    }
  }
}
