import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/balance_card_view.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/scroll_balance_cubit/cubit/scroll_balance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/scroll_balance_cubit/cubit/scroll_balance_state.dart';

class BalanceCardsCarousel extends StatelessWidget {
  const BalanceCardsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<ScrollBalanceCubit>()..initial(),
        child: const _BalanceCardCarousel());
  }
}

class _BalanceCardCarousel extends StatelessWidget {
  const _BalanceCardCarousel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollBalanceCubit, ScrollBalanceState>(
      builder: (context, state) {
        if (state is ScrollBalanceLoadedState) {
          return SizedBox(
            height: 220,
            width: double.infinity,
            child: PageView.builder(
              controller: state.pageController,
              itemBuilder: (_, index) {
                return BalanceCardView(
                  balanceCard: state.listOfCards[index],
                );
              },
              itemCount: state.listOfCards.length,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
