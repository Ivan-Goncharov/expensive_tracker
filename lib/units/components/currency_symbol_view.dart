import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:flutter/material.dart';

class CurrencySymbolView extends StatelessWidget {
  final CurrencyData currencyData;
  final double titleSize;
  final Color? titleColor;
  const CurrencySymbolView(
    this.currencyData,
    this.titleSize, {
    this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (currencyData.type == 0) {
      return Text(
        currencyData.symbol,
        style: TextStyle(
          color: titleColor ?? Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w500,
          fontSize: titleSize,
        ),
      );
    } else {
      return CryptoLogoIage(currencyData.symbol);
    }
  }
}
