import 'package:expensive_tracker_app/units/navigation/components/cubit/bottom_hide_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  /// Bloc and Cubit
  getIt.registerFactory(() => NavigatorCubit());
  getIt.registerFactory(() => BottomHideCubit());
}
