import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/view/cubit/start_screen_state.dart';

class StartScreenCubit extends Cubit<StartScreenState> {
  StartScreenCubit() : super(StartScreenInitialState());

  Future<void> startApp() async {
    final repo = getIt<StartScreenRepo>();
    emit(StartScreenLoadingState());

    final isNotFirstStart = await repo.isFirstStart();
    if (!isNotFirstStart) {
      await repo.saveStartInfo();
    }
    repo.getListOfMonth();
    await repo.getAllCategories();
    emit(StartScreenLoadedState());
  }
}
