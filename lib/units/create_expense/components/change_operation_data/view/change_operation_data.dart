import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

final listExpense = [
  const CategoryOperationModel(
    title: SResources.foodCategory,
    icon: FontAwesomeIcons.bowlRice,
  ),
];

class _CreateExpenseBodyState extends State<_CreateExpenseBody> {
  var currentIndex = -1;
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return IconButton(
            onPressed: () {
              if (index == currentIndex) {
                changeIndex(-1);
              } else {
                changeIndex(index);
              }
            },
            icon: Icon(
              FontAwesomeIcons.airbnb,
              color: index == currentIndex ? Colors.red : Colors.black,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}

class _CreateIncomeBody extends StatelessWidget {
  const _CreateIncomeBody();

  @override
  Widget build(BuildContext context) {
    return const Text('INCOME');
  }
}
