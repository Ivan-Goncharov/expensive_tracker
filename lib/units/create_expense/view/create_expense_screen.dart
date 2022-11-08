import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/change_operation_data.dart';
import 'package:expensive_tracker_app/units/create_expense/components/date_title/view/date_titile.dart';
import 'package:expensive_tracker_app/units/create_expense/components/input_money_quantity/view/input_money_quantity.dart';
import 'package:expensive_tracker_app/units/create_expense/components/save_button/view/save_button.dart';
import 'package:expensive_tracker_app/units/create_expense/components/switch_operation/switch_operation.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        title: const Text(SResources.newOperation),
        titleTextStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        elevation: 0,
        leadingWidth: 100,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: colors.tertiary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                DateTitle(),
                SwitchOperation(),
                InputMoneyQuantity(),
                ChangeOperationData(),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
