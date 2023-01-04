import 'package:equatable/equatable.dart';

abstract class StartScreenState implements Equatable {}

class StartScreenInitialState implements StartScreenState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class StartScreenLoadingState implements StartScreenState {
  @override
  List<Object?> get props => [2];

  @override
  bool? get stringify => true;
}

class StartScreenFirstStartState implements StartScreenState {
  @override
  List<Object?> get props => [3];

  @override
  bool? get stringify => true;
}

class StartScreenIsNotFirstStartState implements StartScreenState {
  @override
  List<Object?> get props => [4];

  @override
  bool? get stringify => true;
}
