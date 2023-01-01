import 'package:flutter/material.dart';

Decoration getDecoration({
  required double firstOffset,
  required double secondOffset,
  required double blurRadius,
  required BuildContext context,
}) {
  final colors = Theme.of(context).colorScheme;
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: colors.background,
    boxShadow: [
      BoxShadow(
          color: const Color(0xFF9E9E9E),
          offset: Offset(firstOffset, firstOffset),
          blurRadius: blurRadius,
          spreadRadius: 0.1),
      BoxShadow(
          color: colors.onPrimary,
          offset: Offset(secondOffset, secondOffset),
          blurRadius: blurRadius,
          spreadRadius: 0.1),
    ],
  );
}

// borderRadius: BorderRadius.circular(15),
//           color: colors.background,
//           boxShadow: [
//             const BoxShadow(
//                 color: Color(0xFF9E9E9E),
//                 offset: Offset(1.0, 1.0),
//                 blurRadius: 5.0,
//                 spreadRadius: 1.0),
//             BoxShadow(
//                 color: colors.onPrimary,
//                 offset: const Offset(-1.0, -1.0),
//                 blurRadius: 5.0,
//                 spreadRadius: 1.0),
//           ],
