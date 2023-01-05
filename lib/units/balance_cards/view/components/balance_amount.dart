import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:flutter/material.dart';

class BalanceAmount extends StatelessWidget {
  final CurrencyData currencyData;
  final double amount;
  const BalanceAmount(this.currencyData, this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BalanceSymbol(currencyData),
        const SizedBox(width: 5),
        AnimatedFlipCounter(
          duration: const Duration(milliseconds: 500),
          value: amount,
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class _BalanceSymbol extends StatelessWidget {
  final CurrencyData currencyData;
  const _BalanceSymbol(this.currencyData);

  @override
  Widget build(BuildContext context) {
    if (currencyData.type == 0) {
      return Text(
        currencyData.symbol,
        style: const TextStyle(color: Colors.black, fontSize: 30),
      );
    } else {
      return CryptoLogoIage(currencyData.symbol);
    }
  }
}
