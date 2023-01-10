import 'package:expensive_tracker_app/data/app_db/app_db.dart';

import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelectCurrencyButton extends StatelessWidget {
  final CurrencyData? currency;
  final double height;
  final double? width;
  final NeumorphicBoxShape? boxShape;
  final bool isAddBalance;
  const SelectCurrencyButton(
    this.currency, {
    super.key,
    this.height = 40,
    this.width,
    this.boxShape = const NeumorphicBoxShape.stadium(),
    this.isAddBalance = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(searchCurrensiesRoute),
      child: ContainerNemorophicEmboss(
        widget: _SelectCurrencyTitle(currency),
        height: height,
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        boxShape: boxShape,
        alignment: isAddBalance ? Alignment.centerLeft : Alignment.center,
      ),
    );
  }
}

class _SelectCurrencyTitle extends StatelessWidget {
  final CurrencyData? currency;

  const _SelectCurrencyTitle(this.currency);

  @override
  Widget build(BuildContext context) {
    if (currency == null) {
      return Text('Select the card currency',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ));
    } else if (currency!.type == 0) {
      return Text(
        '${currency!.symbol} - ${currency!.name}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CryptoLogoIage(currency!.symbol),
          const SizedBox(width: 5),
          Text(
            currency!.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      );
    }
  }
}
