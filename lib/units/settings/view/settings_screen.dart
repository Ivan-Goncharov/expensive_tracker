import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:flutter/material.dart';

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
            _SettingsElement(
              title: SResources.darkMode,
              backgroundColor: Colors.white,
              iconColor: Colors.purple,
              iconData: Icons.monochrome_photos,
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
  // final Widget trailingWidget;
  const _SettingsElement({
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    required this.iconData,
    // required this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
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
        ],
      ),
    );
  }
}
