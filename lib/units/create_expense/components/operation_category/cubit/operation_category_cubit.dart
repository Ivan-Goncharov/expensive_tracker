import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'operation_category_state.dart';

class OperationCategoryCubit extends Cubit<OperationCategoryState> {
  OperationCategoryCubit() : super(OperationCategoryInitial());
  late List<CategoryOperationModel> _categories;
  var _selectCategoryIndex = -1;

  void initial(List<CategoryOperationModel> list) {
    _categories = list;
    emit(OperationChangeCategoryState(_categories, _selectCategoryIndex));
  }

  void changeCategory(int index, BuildContext context) {
    if (index != _selectCategoryIndex) {
      _selectCategoryIndex = index;
      BlocProvider.of<CreateOperationCubit>(context)
          .changeCategory(_categories[index].title);
      emit(OperationChangeCategoryState(_categories, _selectCategoryIndex));
    }
  }
}
