part of 'date_picker_cubit.dart';

@immutable
abstract class DatePickerState {}

class DatePickerInitial extends DatePickerState {}

class DatePickerChangeState extends DatePickerState {
  final DateTime dateTime;
  DatePickerChangeState(this.dateTime);
}
