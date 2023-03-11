import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/helpers/default_app_bar.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/change_operation_data.dart';
import 'package:expensive_tracker_app/units/create_expense/components/date_title/view/date_titile.dart';
import 'package:expensive_tracker_app/units/create_expense/components/input_money_quantity/view/input_money_quantity.dart';
import 'package:expensive_tracker_app/units/create_expense/components/switch_operation/switch_operation.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateExpenseScreen extends StatelessWidget {
  const CreateExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ChangeCategoriesCubit>()..initial()),
        BlocProvider(create: (_) => getIt<CreateOperationCubit>()..initial())
      ],
      child: const _CreateExpenseScreenBody(),
    );
  }
}

class _CreateExpenseScreenBody extends StatelessWidget {
  const _CreateExpenseScreenBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<CreateOperationCubit, CreateOperationState>(
        listener: (_, state) {
      if (state is CreateOperationError) {
        //TODO: Реализовать оповещение об ошибки создания
      } else if (state is CreateOperationSucces) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: const DefaultAppBar(title: SResources.newOperation),
        backgroundColor: colors.background,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              DateTitle(),
              SwitchOperation(),
              InputMoneyQuantity(),
              ChangeOperationData(),
            ],
          ),
        ),
        floatingActionButton: state is CreateOperationAllowed
            ? Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.onPrimary),
                    onPressed:
                        context.read<CreateOperationCubit>().saveOperation,
                    child: const Text(SResources.saveButton)),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
