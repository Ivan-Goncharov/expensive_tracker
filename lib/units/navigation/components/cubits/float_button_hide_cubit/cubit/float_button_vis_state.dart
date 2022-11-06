part of 'float_button_vis_cubit.dart';

@immutable
abstract class FloatButtonVisState {}

class FloatButtonVisInitial extends FloatButtonVisState {}

class FloatButtonVisChangeState extends FloatButtonVisState {
  final bool isVisible;
  FloatButtonVisChangeState(this.isVisible);
}
