import 'package:cached_network_image/cached_network_image.dart';

import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_state.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCurrencyButton extends StatelessWidget {
  const SelectCurrencyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(searchCurrensiesRoute),
      child: ContainerNemorophicEmboss(
        widget: const _SelectCurrencyTitle(),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}

class _SelectCurrencyTitle extends StatelessWidget {
  const _SelectCurrencyTitle();

  @override
  Widget build(BuildContext context) {
    final state =
        context.read<SelectCurrencyCubit>().state as SelectCurrencyLoadedState;
    final currency = state.currencyData;

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
          CachedNetworkImage(
            imageUrl: currency.symbol,
            height: 26,
            width: 26,
            fadeOutDuration: const Duration(milliseconds: 50),
            fadeInDuration: const Duration(milliseconds: 50),
            placeholder: (_, __) {
              return const CircularProgressIndicator();
            },
          ),
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
