import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOperationCubit, CreateOperationState>(
      listener: (_, state) {
        if (state is CreateOperationError) {
          //TODO: Реализовать оповещение об ошибки создания
        } else if (state is CreateOperationSucces) {
          Navigator.pop(context);
        }
      },
      buildWhen: (previous, current) {
        if (previous != current ||
            current != CreateOperationError() ||
            current != CreateOperationSucces()) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is CreateOperationAllowed) {
          return _SaveButtonWidget(
            BlocProvider.of<CreateOperationCubit>(context).saveOperation,
          );
        } else if (state is CreateOperationNotAllowed ||
            state is CreateOperationError) {
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
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        onPressed: saveOperation == null ? null : () => saveOperation!(),
        child: const Text(SResources.saveButton),
      ),
    );
  }
}
