import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:flutter/material.dart';
import 'package:expensive_tracker_app/helpers/extensions.dart';

class BalanceAmount extends StatelessWidget {
  final CurrencyData currencyData;
  final double amount;
  const BalanceAmount(this.currencyData, this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleSize = getSize(amount.toString());

    /// TODO: Настроить корректное отображение чисел после запятой.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BalanceSymbol(currencyData, titleSize),
        const SizedBox(width: 2),
        Text(
          amount.formatToCurrency(2),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: titleSize,
          ),
        )
      ],
    );
  }

  double getSize(String amount) {
    if (amount.length < 5) {
      return 30.0;
    } else if (amount.length < 15) {
      return 20.0;
    } else {
      return 10.0;
    }
  }
}

class _BalanceSymbol extends StatelessWidget {
  final CurrencyData currencyData;
  final double titleSize;
  const _BalanceSymbol(this.currencyData, this.titleSize);

  @override
  Widget build(BuildContext context) {
    if (currencyData.type == 0) {
      return Text(
        currencyData.symbol,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w500,
            fontSize: titleSize),
      );
    } else {
      return CryptoLogoIage(currencyData.symbol);
    }
  }
}
