import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/components/date_title/cubit/date_picker_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DateTitle extends StatelessWidget {
  const DateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DatePickerCubit>()..initial(),
      child: const _DateTitleBody(),
    );
  }
}

class _DateTitleBody extends StatelessWidget {
  const _DateTitleBody();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () async =>
              await BlocProvider.of<DatePickerCubit>(context).pickDate(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(FontAwesomeIcons.calendar),
              const SizedBox(
                width: 6,
              ),
              BlocBuilder<DatePickerCubit, DatePickerState>(
                builder: (context, state) {
                  if (state is DatePickerChangeState) {
                    BlocProvider.of<CreateOperationCubit>(context)
                        .changeDateTime(state.dateTime);
                    return Text(
                      DateFormat('EEEE, d MMMM').format(
                        state.dateTime,
                      ),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
