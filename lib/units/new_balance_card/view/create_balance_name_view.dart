import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/balance_icon.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/create_card_title.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/next_button.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/text_field_card.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/cubit/create_card_name_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/cubit/create_card_name_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateBalanceNameView extends StatelessWidget {
  const CreateBalanceNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateCardNameCubit>()..initial(),
      child: const _CreateBalanceNameBody(),
    );
  }
}

class _CreateBalanceNameBody extends StatelessWidget {
  const _CreateBalanceNameBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: BlocBuilder<CreateCardNameCubit, CreateCardNameState>(
        builder: (context, state) {
          if (state is CreateCardNameSuccesState) {
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
                    const CreateCardTitle(SResources.createCardNameTitle),
                    const SizedBox(height: 20),
                    TextFieldCard(state.textController),
                    const SizedBox(height: 20),
                    NextButtonView(
                        context.read<CreateCardNameCubit>().saveInput,
                        state.isShowButton),
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
