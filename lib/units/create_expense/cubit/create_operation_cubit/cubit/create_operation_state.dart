part of 'create_operation_cubit.dart';

abstract class CreateOperationState extends Equatable {
  const CreateOperationState();

  @override
  List<Object> get props => [];
}

class CreateOperationInitial extends CreateOperationState {}

class CreateOperationNotAllowed extends CreateOperationState {}

class CreateOperationAllowed extends CreateOperationState {}
