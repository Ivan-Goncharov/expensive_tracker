import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/theme/domain/themes_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemesBloc extends Bloc<ThemesState, ThemesState> {
  final ThemesRepository _repository;
  ThemesBloc(this._repository) : super(_repository.getAppTheme()) {
    on<ThemesState>((event, emit) {
      emit(event);
      _repository.saveAppTheme(event);
    });
  }
}
