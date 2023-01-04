import 'package:expensive_tracker_app/data/app_db/app_db.dart';

import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';

class SelectCurrencyButton extends StatelessWidget {
  final CurrencyData currency;
  const SelectCurrencyButton(this.currency, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(searchCurrensiesRoute),
      child: ContainerNemorophicEmboss(
        widget: _SelectCurrencyTitle(currency),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}

class _SelectCurrencyTitle extends StatelessWidget {
  final CurrencyData currency;

  const _SelectCurrencyTitle(this.currency);

  @override
  Widget build(BuildContext context) {
    if (currency.type == 0) {
      return Text(
        '${currency.symbol} - ${currency.name}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CryptoLogoIage(currency.symbol),
          const SizedBox(width: 5),
          Text(
            currency.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      );
    }
  }
}
