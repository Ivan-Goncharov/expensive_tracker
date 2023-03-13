import 'package:flutter/material.dart';

enum ThemesState {
  light,
  dark,
  system;

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
