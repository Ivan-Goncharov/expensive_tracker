// ignore_for_file: prefer_const_constructors

import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubit/balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubit/balance_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BalanceCardView extends StatelessWidget {
  const BalanceCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BalanceCardCubit>()..initial(),
      child: const _BalanceCardBody(),
    );
  }
}

class _BalanceCardBody extends StatelessWidget {
  const _BalanceCardBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors.background,
        boxShadow: [
          const BoxShadow(
              color: Color(0xFF9E9E9E),
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: colors.onPrimary,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
      ),
      child: BlocBuilder<BalanceCardCubit, BalanceCardState>(
        builder: (context, state) {
          if (state is BalanceCardLoadedState) {
            print(
                'DEBUG  STATE ${state.balanceCardModel}  \n ${state.currencyData}');
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    SResources.balance,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                const Text(
                  '\$0.0',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _SpendingWidget(
                          color: Colors.green,
                          title: SResources.income,
                          quantity: '\$0.0',
                          icon: FontAwesomeIcons.arrowUp),
                      _SpendingWidget(
                          color: Colors.red,
                          title: SResources.expense,
                          quantity: '0.0',
                          icon: FontAwesomeIcons.arrowDown),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _SpendingWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String quantity;
  final IconData icon;
  const _SpendingWidget({
    required this.color,
    required this.title,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 16,
            color: color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              quantity,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
