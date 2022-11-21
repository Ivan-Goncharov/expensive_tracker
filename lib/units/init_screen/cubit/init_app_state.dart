part of 'init_app_cubit.dart';

abstract class InitAppState extends Equatable {
  const InitAppState();

  @override
  List<Object> get props => [];
}

class InitAppInitial extends InitAppState {}

class InitAppStartState extends InitAppState {}
