import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/balance_icon.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/create_card_title.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/next_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/select_currency_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectBalanceCardView extends StatelessWidget {
  const SelectBalanceCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SelectCurrencyCubit>()..initial(),
      child: const _SelectBalanceCardBody(),
    );
  }
}

class _SelectBalanceCardBody extends StatelessWidget {
  const _SelectBalanceCardBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: BlocBuilder<SelectCurrencyCubit, SelectCurrencyState>(
        builder: (context, state) {
          if (state is SelectCurrencyLoadedState) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BalanceIcon(FontAwesomeIcons.filePen),
                    const SizedBox(height: 20),
                    const CreateCardTitle(SResources.selectCurrencyOfCard),
                    const SizedBox(height: 20),
                    const SelectCurrencyButton(),
                    const SizedBox(height: 20),
                    NextButtonView(
                      context.read<SelectCurrencyCubit>().saveChoise,
                      true,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
