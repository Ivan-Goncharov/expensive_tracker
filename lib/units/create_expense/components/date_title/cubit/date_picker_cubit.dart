import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerInitial());

  DateTime? _dateTime;

  void initial() {
    _dateTime = DateTime.now();
    emit(DatePickerChangeState(_dateTime!));
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime!,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if (newDate != null) {
      _dateTime = newDate;
    }
    emit(DatePickerChangeState(_dateTime!));
  }
}
