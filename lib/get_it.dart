import 'package:expensive_tracker_app/units/balance_cards/data/repositories/balance_cards_repo_impl.dart';
import 'package:expensive_tracker_app/units/balance_cards/data/services/balance_cards_service.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubit/balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/components/date_title/cubit/date_picker_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/components/operation_category/cubit/operation_category_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/change_categories_cubit/change_categories_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/cubit/create_operation_cubit/cubit/create_operation_cubit.dart';
import 'package:expensive_tracker_app/units/create_expense/data/repositories/create_operation_repo_impl.dart';
import 'package:expensive_tracker_app/units/create_expense/data/services/create_operation_service.dart';
import 'package:expensive_tracker_app/units/create_expense/domain/repositories/create_operation_repo.dart';
import 'package:expensive_tracker_app/units/home/cubit/month_change_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/cubit/last_operationes_cubit.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/repo/last_operationes_repo_impl.dart';
import 'package:expensive_tracker_app/units/last_operationes/data/services/last_operationes_services.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:expensive_tracker_app/units/navigation/components/cubits/float_button_hide_cubit/cubit/float_button_vis_cubit.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/data/create_balance_card_dervice.dart';
import 'package:expensive_tracker_app/units/new_balance_card/data/create_balance_card_repo_impl.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/balance_amount_cubit/balance_amount_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/create_card_name_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/select_currency_cubit/select_currency_cubit.dart';
import 'package:expensive_tracker_app/units/start_screen/data/repositories/start_screen_repo_impl.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/view/cubit/start_screen_cubit.dart';
import 'package:get_it/get_it.dart';

import 'units/last_operationes/data/repo/month_repository_impl.dart';
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
  getIt.registerSingleton<BalanceCardsService>(const BalanceCardServiceImpl());
  getIt.registerSingleton<CreateBalanceCardService>(
    CreateBalanceCardServiceImpl(),
  );

  /// Repo
  getIt.registerSingleton<CreateOperationRepository>(
      CreateOperationRepoImpl(getIt()));
  getIt
      .registerSingleton<LastOperationesRepo>(LastOperationesRepoImpl(getIt()));
  getIt.registerSingleton<StartScreenRepo>(StartScreenRepoImpl(getIt()));
  getIt.registerSingleton<MonthRepositoty>(MothRepositoryImpl(getIt()));
  getIt.registerSingleton<BalanceCardRepo>(BalanceCardsRepoImpl(getIt()));
  getIt.registerSingleton<CreateBalanceCardRepo>(
      CreateBalanceCardRepoImpl(getIt()));

  /// Bloc and Cubit
  getIt.registerFactory(() => NavigatorCubit());
  getIt.registerFactory(() => BottomHideCubit());
  getIt.registerFactory(() => FloatButtonVisCubit());
  getIt.registerFactory(() => DatePickerCubit());
  getIt.registerFactory(() => ChangeCategoriesCubit(getIt()));
  getIt.registerFactory(() => OperationCategoryCubit());
  getIt.registerFactory(() => CreateOperationCubit());
  getIt.registerFactory(() => LastOperationesCubit(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => StartScreenCubit(getIt(), getIt()));
  getIt.registerFactory(() => MonthChangeCubit(getIt()));
  getIt.registerFactory(() => CreateCardNameCubit(getIt()));
  getIt.registerFactory(() => SelectCurrencyCubit(getIt()));
  getIt.registerFactory(() => SearchCurrencyCubit(getIt()));
  getIt.registerFactory(() => BalanceAmountCubit(getIt()));
  getIt.registerFactory(() => BalanceCardCubit(getIt(), getIt(), getIt()));
}
