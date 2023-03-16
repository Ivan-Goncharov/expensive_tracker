
import 'package:flutter/material.dart';


class SettingsElement extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconData;
  final Widget? trailing;
  const SettingsElement({super.key, 
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    required this.iconData,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(
              iconData,
              color: iconColor,
            ),
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
          const Spacer(),
          trailing ?? const SizedBox()
        ],
      ),
    );
  }
}