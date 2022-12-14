import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreateCardNameState implements Equatable {}

class CreateCardNameInitialState implements CreateCardNameState {
  @override
  List<Object?> get props => [1];

  @override
  bool? get stringify => true;
}

class CreateCardNameLoadingState implements CreateCardNameState {
  @override
  List<Object?> get props => [2];

  @override
  bool? get stringify => true;
}

class CreateCardNameSuccesState implements CreateCardNameState {
  final TextEditingController textController;
  final bool isShowButton;
  CreateCardNameSuccesState(
    this.textController,
    this.isShowButton,
  );

  @override
  List<Object?> get props => [textController, isShowButton];

  @override
  bool? get stringify => true;
}

class CreateCardNameFinishState implements CreateCardNameState {
  @override
  List<Object?> get props => [3];

  @override
  bool? get stringify => true;
}
