import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';

abstract class ThemeService {
  /// Получение темы приложения
  ThemesState getThemeState();

  /// Сохранение  выбора новой темы для приложения
  Future<void> saveAppTheme(ThemesState theme);
}

class ThemeServiceImpl implements ThemeService {
  late final StorageProvider _storage;
  ThemeServiceImpl(this._storage);

  @override
  ThemesState getThemeState() {
    final value = _storage.prefs.get(PrefKeys.appTheme) as String?;
    if (value != null) {
      return ThemesState.values.byName(value);
    } else {
      return ThemesState.system;
    }
  }

  @override
  Future<void> saveAppTheme(ThemesState theme) =>
      _storage.prefs.put(PrefKeys.appTheme, theme.name);
}
