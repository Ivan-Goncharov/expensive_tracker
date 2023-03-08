import 'package:expensive_tracker_app/theme/extension/color_extension.dart';
import 'package:flutter/material.dart';

/// Тема приложения
class MyThemeApp {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF4659A9),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFDDE1FF),
      onPrimaryContainer: Color(0xFF001355),
      secondary: Color(0xFF116D34),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF9FF6AE),
      onSecondaryContainer: Color(0xFF00210A),
      tertiary: Color(0xFF5256A9),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFE1E0FF),
      onTertiaryContainer: Color(0xFF080764),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFEFBFF),
      onBackground: Color(0xFF1B1B1F),
      surface: Color(0xFFFEFBFF),
      onSurface: Color(0xFF1B1B1F),
      surfaceVariant: Color(0xFFE2E1EC),
      onSurfaceVariant: Color(0xFF45464F),
      outline: Color(0xFF767680),
      onInverseSurface: Color(0xFFF2F0F4),
      inverseSurface: Color(0xFF303034),
      inversePrimary: Color(0xFFB8C3FF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF4659A9),
      outlineVariant: Color(0xFFC6C5D0),
      scrim: Color(0xFF000000),
    ),
    extensions: [
      ColorExtnesion.light,
    ]
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFB8C3FF),
      onPrimary: Color(0xFF112878),
      primaryContainer: Color(0xFF2C4090),
      onPrimaryContainer: Color(0xFFDDE1FF),
      secondary: Color(0xFF84D994),
      onSecondary: Color(0xFF003917),
      secondaryContainer: Color(0xFF005224),
      onSecondaryContainer: Color(0xFF9FF6AE),
      tertiary: Color(0xFFC0C1FF),
      onTertiary: Color(0xFF222578),
      tertiaryContainer: Color(0xFF3A3D8F),
      onTertiaryContainer: Color(0xFFE1E0FF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF1B1B1F),
      onBackground: Color(0xFFE4E1E6),
      surface: Color(0xFF1B1B1F),
      onSurface: Color(0xFFE4E1E6),
      surfaceVariant: Color(0xFF45464F),
      onSurfaceVariant: Color(0xFFC6C5D0),
      outline: Color(0xFF90909A),
      onInverseSurface: Color(0xFF1B1B1F),
      inverseSurface: Color(0xFFE4E1E6),
      inversePrimary: Color(0xFF4659A9),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFB8C3FF),
      outlineVariant: Color(0xFF45464F),
      scrim: Color(0xFF000000),
    ),
    extensions: [
      ColorExtnesion.dark,
    ]
  );
}
