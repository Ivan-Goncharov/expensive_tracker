 
import 'package:equatable/equatable.dart';

abstract class StartScreenState implements Equatable { 
}

class StartScreenInitialState implements StartScreenState{
  @override
  List<Object?> get props => [];

  @override 
  bool? get stringify => true;

}

class StartScreenLoadingState implements StartScreenState {
  @override 
  List<Object?> get props => [];

  @override 
  bool? get stringify => true;
}

class StartScreenLoadedState implements StartScreenState {
  @override 
  List<Object?> get props => [];

  @override 
  bool? get stringify => true;
}
