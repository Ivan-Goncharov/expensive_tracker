part of 'create_operation_cubit.dart';

abstract class CreateOperationState extends Equatable {
  const CreateOperationState();

  @override
  List<Object> get props => [];
}

class CreateOperationInitial implements CreateOperationState {
  @override
  List<Object> get props => [1];

  @override
  bool? get stringify => true;
}

class CreateOperationNotAllowed implements CreateOperationState {
  @override
  List<Object> get props => [2];

  @override
  bool? get stringify => true;
}

class CreateOperationAllowed implements CreateOperationState {
  @override
  List<Object> get props => [3];

  @override
  bool? get stringify => true;
}

class CreateOperationError implements CreateOperationState {
  @override
  List<Object> get props => [4];

  @override
  bool? get stringify => true;
}

class CreateOperationSucces implements CreateOperationState {
  @override
  List<Object> get props => [5];

  @override
  bool? get stringify => true;
}
