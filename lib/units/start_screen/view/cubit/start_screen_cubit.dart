import 'package:bloc/bloc.dart';
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
    } 
    // await monthRepositoty.getListOfMonth();
    // await startScreenRepo.getAllCategories();
    emit(StartScreenLoadedState());
  }
}
