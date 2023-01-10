import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/helpers/default_app_bar.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_state.dart';
import 'package:expensive_tracker_app/units/add_balance_card/view/components/add_card_field_title.dart';
import 'package:expensive_tracker_app/units/add_balance_card/view/components/text_field_name.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/select_currency_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddBalanceCardView extends StatelessWidget {
  const AddBalanceCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddNewBalanceCardCubit>()..initial(),
      child: const _AddBalanceCardBody(),
    );
  }
}

class _AddBalanceCardBody extends StatelessWidget {
  const _AddBalanceCardBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: SResources.addNewCardBarTitle),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<AddNewBalanceCardCubit, AddNewBalanceCardState>(
        builder: (context, state) {
          if (state is AddNewBalanceCardLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddNewBalanceCardLoadedState) {
            return _AddCardLoadedBody(state);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _AddCardLoadedBody extends StatelessWidget {
  final AddNewBalanceCardLoadedState loadedState;
  const _AddCardLoadedBody(this.loadedState);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddNewBalanceCardCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AddCardFieldTitle(SResources.nameOfCardTitle),
            const SizedBox(height: 8),
            AddCardNameText(
              hintTitle: SResources.addCardNameHint,
              function: cubit.changeInputName,
            ),
            const SizedBox(height: 16),
            const AddCardFieldTitle(SResources.balance),
            const SizedBox(height: 8),
            AddCardNameText(
              function: cubit.changeInputBalance,
              hintTitle: SResources.addCardCurrencyHint,
              textInputTupe:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'(^\d*\.?\d*)'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AddCardFieldTitle(SResources.currency),
            SelectCurrencyButton(
              loadedState.currencyData,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              boxShape: null,
              isAddBalance: true,
            ),
          ],
        ),
      ),
    );
  }
}
