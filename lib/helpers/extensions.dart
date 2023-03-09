import 'package:expensive_tracker_app/theme/extension/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  ColorExtnesion get colorsExtension =>
      Theme.of(this).extension<ColorExtnesion>()!;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension FormatCurrency on double {
  String formatToCurrency(int decimialDigits) {
    final formatter = NumberFormat.simpleCurrency(
        decimalDigits: decimialDigits, locale: 'en_US');

    return formatter.format(this).substring(1);
  }
}

extension DateFormatExtension on DateTime {
  String formatToDateDivider() {
    return DateFormat('d MMMM').format(this);
  }
}
