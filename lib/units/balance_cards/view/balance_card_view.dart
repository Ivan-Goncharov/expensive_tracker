import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/helpers/extensions.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/models/item_balance_card_model.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/components/balance_amount.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/components/spending_month.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCardView extends StatelessWidget {
  final ItemBalanceCardModel balanceCard;
  const BalanceCardView({
    super.key,
    required this.balanceCard,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BalanceCardCubit>()..initial(balanceCard),
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
      margin: const EdgeInsets.fromLTRB(16.0, 8, 16, 16),
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors.background,
        boxShadow: [
          BoxShadow(
              color: context.colorsExtension.shadowContainerFirst,
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: context.colorsExtension.shadowContainerSecond,
              offset: const Offset(-5.0, -5.0),
              blurRadius: 10.0,
              spreadRadius: 1.0),
        ],
      ),
      child: BlocBuilder<BalanceCardCubit, BalanceCardState>(
        builder: (context, state) {
          if (state is BalanceCardLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    state.balanceCardModel.name,
                    style: TextStyle(
                      color: colors.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                BalanceAmount(
                  state.currencyData,
                  state.balanceCardModel.amount,
                ),
                SpendingMonth(state.monthOperationAmount),
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
