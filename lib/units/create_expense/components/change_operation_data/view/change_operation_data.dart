import 'package:expensive_tracker_app/units/create_expense/components/operation_category/view/operation_category.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeOperationData extends StatelessWidget {
  const ChangeOperationData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOperationCubit, CreateOperationState>(
      builder: (context, state) {
        if (state is CreateExpenseState) {
          return const _CreateExpenseBody();
        } else if (state is CreateIncomeState) {
          return const _CreateIncomeBody();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _CreateExpenseBody extends StatefulWidget {
  const _CreateExpenseBody();

  @override
  State<_CreateExpenseBody> createState() => _CreateExpenseBodyState();
}

class _CreateExpenseBodyState extends State<_CreateExpenseBody> {
  var currentIndex = -1;
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const OperationCategoryWidget();
  }
}

class _CreateIncomeBody extends StatelessWidget {
  const _CreateIncomeBody();

  @override
  Widget build(BuildContext context) {
    return const Text('INCOME');
  }
}
