import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OperationIcon extends StatelessWidget {
  final int iconCode;
  const OperationIcon(
    this.iconCode, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: colors.onBackground,
        shape: BoxShape.circle,
        // border: Border.all(color: const Color(0xFF9E9E9E)),
      ),
      child: Icon(
        IconDataSolid(iconCode),
        color: Theme.of(context).colorScheme.background,
        size: 20,
      ),
    );
  }
}
