part of 'bottom_hide_cubit.dart';

@immutable
abstract class BottomHideState {}

class BottomHideInitial extends BottomHideState {}

class BottomHideChangeState extends BottomHideState {
  final bool isHide;
  BottomHideChangeState(this.isHide);
}
