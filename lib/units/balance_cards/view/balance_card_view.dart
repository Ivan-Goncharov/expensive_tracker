import 'package:expensive_tracker_app/get_it.dart';
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
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.4,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    state.balanceCardModel.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
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
