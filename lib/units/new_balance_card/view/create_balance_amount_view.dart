import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/balance_icon.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/create_card_title.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/input_balance.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/next_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/balance_amount_cubit/balance_amount_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/balance_amount_cubit/balance_amount_state.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateBalanceAmount extends StatelessWidget {
  const CreateBalanceAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BalanceAmountCubit>()..initial(),
      child: const _CreateBalanceAmountBody(),
    );
  }
}

class _CreateBalanceAmountBody extends StatelessWidget {
  const _CreateBalanceAmountBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      body: BlocConsumer<BalanceAmountCubit, BalanceAmountState>(
        listener: (context, state) async {
          if (state is BalanceAmountCreateFinishState) {
            Navigator.pushReplacementNamed(context, navScreenRoute);
          }
        },
        listenWhen: ((previous, current) {
          if (current is BalanceAmountCreateFinishState) {
            return true;
          } else {
            return false;
          }
        }),
        buildWhen: (previous, current) {
          if (current is BalanceAmountCreateFinishState) {
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          if (state is BalanceAmountLoadedState) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BalanceIcon(FontAwesomeIcons.coins),
                    const SizedBox(height: 20),
                    const CreateCardTitle(SResources.adjustBalanceTitle),
                    const SizedBox(height: 20),
                    InputBalance(state.textController, state.currencyData),
                    const SizedBox(height: 20),
                    NextButtonView(
                      context.read<BalanceAmountCubit>().saveInput,
                      true,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BalanceAmountLoadingState) {
            /// TODO: Реализовать экран загрузочный.
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
