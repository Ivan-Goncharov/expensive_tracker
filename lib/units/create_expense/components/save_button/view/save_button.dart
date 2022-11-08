import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOperationCubit, CreateOperationState>(
      builder: (context, state) {
        if (state is CreateOperationAllowed) {
          return _SaveButtonWidget(
            BlocProvider.of<CreateOperationCubit>(context).saveOperation,
          );
        } else if (state is CreateOperationNotAllowed) {
          return const _SaveButtonWidget();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  final Function? saveOperation;
  const _SaveButtonWidget([this.saveOperation]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => saveOperation,
      child: const Text(SResources.saveButton),
    );
  }
}
