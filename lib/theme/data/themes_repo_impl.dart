import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/theme/data/themes_service.dart';
import 'package:expensive_tracker_app/theme/domain/themes_repo.dart';

class ThemesRepositoryImpl implements ThemesRepository {
  final ThemeService _service;
  ThemesRepositoryImpl(this._service);

  @override
  ThemesState getAppTheme() => _service.getThemeState();

  @override
  Future<void> saveAppTheme(ThemesState theme) => _service.saveAppTheme(theme);
}
