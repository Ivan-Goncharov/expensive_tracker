import 'package:expensive_tracker_app/units/create_expense/components/date_title/cubit/date_picker_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/data/repositories/create_operation_repo_impl.dart';
import 'package:expensive_tracker_app/units/create_expense/data/services/create_operation_service.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/repo/last_operationes_repo_impl.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/services/last_operationes_services.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/navigation/components/cubits/float_button_hide_cubit/cubit/float_button_vis_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:expensive_tracker_app/units/start_screen/data/repositories/start_screen_repo_impl.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';
import 'package:get_it/get_it.dart';

import 'units/navigation/components/cubits/bottom_hide_cubit/bottom_hide_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  /// Servises.
  getIt.registerSingleton<CreateOpeartionService>(
    CreateOpeartionServiceImpl(),
  );
  getIt.registerSingleton<LastOperationesSevices>(
    LastOperationesServicesImpl(),
  );
  getIt.registerSingleton<StartScreenService>(
    StartScreenServiceImpl(),
  );

  /// Repo
  getIt.registerSingleton<CreateOperationRepository>(CreateOperationRepoImpl());
  getIt.registerSingleton<LastOperationesRepo>(LastOperationesRepoImpl());
  getIt.registerSingleton<StartScreenRepo>(StartScreenRepoImpl(getIt()));

  /// Bloc and Cubit
  getIt.registerFactory(() => NavigatorCubit());
  getIt.registerFactory(() => BottomHideCubit());
  getIt.registerFactory(() => FloatButtonVisCubit());
  getIt.registerFactory(() => DatePickerCubit());
  getIt.registerFactory(() => ChangeCategoriesCubit());
  getIt.registerFactory(() => OperationCategoryCubit());
  getIt.registerFactory(() => CreateOperationCubit());
  getIt.registerFactory(() => LastOperationesCubit());
}
