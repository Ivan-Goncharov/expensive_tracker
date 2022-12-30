part of 'operation_category_cubit.dart';

abstract class OperationCategoryState extends Equatable {
  const OperationCategoryState();

  @override
  List<Object> get props => [];
}

class OperationCategoryInitial extends OperationCategoryState {}

class OperationChangeCategoryState extends OperationCategoryState {
  final List<OperationCategories> categories;
  final int indexOfSelect;
  const OperationChangeCategoryState(this.categories, this.indexOfSelect);

  @override
  List<Object> get props => [categories, indexOfSelect];
}
