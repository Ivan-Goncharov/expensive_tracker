import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/balance_cards_repo.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/view/cubit/start_screen_state.dart';

class StartScreenCubit extends Cubit<StartScreenState> {
  final StartScreenRepo startScreenRepo;
  final MonthRepositoty monthRepositoty;

  StartScreenCubit(this.startScreenRepo, this.monthRepositoty)
      : super(StartScreenInitialState());

  Future<void> startApp() async {
    emit(StartScreenLoadingState());
    final isNotFirstStart = await startScreenRepo.isFirstStart();
    if (!isNotFirstStart) {
      await startScreenRepo.saveStartInfo();
      emit(StartScreenFirstStartState());
      await startScreenRepo.getAllCategories();
    } else {
      await startScreenRepo.getAllCategories();
      getIt<BalanceCardRepo>().getAllCards();
      await monthRepositoty.getListOfMonth();
      emit(StartScreenIsNotFirstStartState());
    }
  }
}
