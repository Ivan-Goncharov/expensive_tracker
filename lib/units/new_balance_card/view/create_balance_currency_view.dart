import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/balance_icon.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/create_card_title.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/next_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/select_currency_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_state.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
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
      body: BlocConsumer<SelectCurrencyCubit, SelectCurrencyState>(
        listener: (context, state) {
          if (state is SelectCurrencySaveSelectState) {
            Navigator.of(context)
                .pushReplacementNamed(createBalanceAmountRoute);
          }
        },
        buildWhen: (_, current) {
          if (current is SelectCurrencySaveSelectState) return false;
          return true;
        },
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
                    const BalanceIcon(FontAwesomeIcons.moneyBill1Wave),
                    const SizedBox(height: 20),
                    CreateCardTitle(t.strings.selectCurrencyOfCard),
                    const SizedBox(height: 20),
                    SelectCurrencyButton(state.currencyData),
                    const SizedBox(height: 20),
                    NextButtonView(
                      context.read<SelectCurrencyCubit>().saveChoise,
                      true,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SelectCurrencyLoadingState) {
            /// TODO: Добавить загрузочный экран.
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
