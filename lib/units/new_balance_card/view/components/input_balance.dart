import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/balance_amount_cubit/balance_amount_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputBalance extends StatelessWidget {
  final TextEditingController textController;
  final CurrencyData currencyData;
  const InputBalance(this.textController, this.currencyData, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerNemorophicEmboss(
      widget: TextFormField(
        controller: textController,
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: _SuffixTextField(currencyData),
          contentPadding: const EdgeInsets.all(8.0),
          isCollapsed: true,
        ),
        onEditingComplete: context.read<BalanceAmountCubit>().saveInput,
      ),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}

class _SuffixTextField extends StatelessWidget {
  final CurrencyData currencyData;
  const _SuffixTextField(this.currencyData);

  @override
  Widget build(BuildContext context) {
    if (currencyData.type == 0) {
      return Text(currencyData.symbol);
    } else {
      return CryptoLogoIage(currencyData.symbol);
    }
  }
}

// TextFormField(
//   controller: _controller,
//   keyboardType: TextInputType.number,
//   inputFormatters: <TextInputFormatter>[
//    // for below version 2 use this
//  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// // for version 2 and greater youcan also use this
//  FilteringTextInputFormatter.digitsOnly
