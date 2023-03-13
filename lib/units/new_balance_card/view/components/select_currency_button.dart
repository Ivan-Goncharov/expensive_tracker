import 'package:expensive_tracker_app/data/app_db/app_db.dart';

import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:expensive_tracker_app/units/add_balance_card/view/components/input_container_material.dart';
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
        child: InputContainerMaterial(
          child: _SelectCurrencyTitle(currency, isAddBalance),
        )

        // ContainerNemorophicEmboss(
        //   widget: ,
        //   height: height,
        //   width: width ?? MediaQuery.of(context).size.width * 0.5,
        //   boxShape: boxShape,
        //   alignment: isAddBalance ? Alignment.centerLeft : Alignment.center,
        // ),
        );
  }
}

class _SelectCurrencyTitle extends StatelessWidget {
  final CurrencyData? currency;
  final bool isAddBalanceCard;

  const _SelectCurrencyTitle(this.currency, this.isAddBalanceCard);

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
        textAlign: isAddBalanceCard ? TextAlign.start : TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      );
    } else {
      return Row(
        mainAxisAlignment: isAddBalanceCard
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
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
