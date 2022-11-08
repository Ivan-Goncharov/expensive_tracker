import 'package:expensive_tracker_app/units/create_expense/components/date_title/cubit/date_picker_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/components/cubits/float_button_hide_cubit/cubit/float_button_vis_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:get_it/get_it.dart';

import 'units/navigation/components/cubits/bottom_hide_cubit/bottom_hide_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  /// Bloc and Cubit
  getIt.registerFactory(() => NavigatorCubit());
  getIt.registerFactory(() => BottomHideCubit());
  getIt.registerFactory(() => FloatButtonVisCubit());
  getIt.registerFactory(() => DatePickerCubit());
  getIt.registerFactory(() => ChangeCategoriesCubit());
  getIt.registerFactory(() => OperationCategoryCubit());
  getIt.registerFactory(() => CreateOperationCubit());
}
