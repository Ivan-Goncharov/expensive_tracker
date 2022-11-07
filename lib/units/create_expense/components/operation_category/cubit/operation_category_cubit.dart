import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/components/change_operation_data/view/data/models/category_model.dart';

part 'operation_category_state.dart';

class OperationCategoryCubit extends Cubit<OperationCategoryState> {
  OperationCategoryCubit() : super(OperationCategoryInitial());
  late List<CategoryOperationModel> _categories;

  void initial(List<CategoryOperationModel> list) {
    _categories = list;
    emit(OperationCategoryInitState(_categories));
  }
}
