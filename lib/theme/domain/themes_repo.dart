import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';

abstract class ThemesRepository {
  /// Получние текущей темы приложения
  ThemesState getAppTheme();

  /// Сохранение новой темы приложения
  Future<void> saveAppTheme(ThemesState theme);
}
