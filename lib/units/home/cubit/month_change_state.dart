import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';

abstract class MonthChangeState implements Equatable {}

class MonthChangeStateInitial implements MonthChangeState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class MonthChangeSuccesState implements MonthChangeState {
  final List<DateTime> listOfDate;
  final CarouselController controller;

  const MonthChangeSuccesState(this.listOfDate, this.controller);
  @override
  List<Object?> get props => [listOfDate, controller];

  @override
  bool? get stringify => true;
}
