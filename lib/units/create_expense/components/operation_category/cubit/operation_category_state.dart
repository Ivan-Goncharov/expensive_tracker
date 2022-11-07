part of 'operation_category_cubit.dart';

abstract class OperationCategoryState extends Equatable {
  const OperationCategoryState();

  @override
  List<Object> get props => [];
}

class OperationCategoryInitial extends OperationCategoryState {}

class OperationCategoryInitState extends OperationCategoryState {
  final List<CategoryOperationModel> categories;
  const OperationCategoryInitState(this.categories);
}
