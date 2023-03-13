import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/theme/data/themes_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();

  /// Получение дефолтной темы
  test('Get default theme', () {
    final result = getIt<ThemeService>().getThemeState();
    expect(result, ThemesState.system);
  });

  test('Save and get dark theme', () async {
    final service = getIt<ThemeService>();
    await service.saveAppTheme(ThemesState.dark);
    final result = service.getThemeState();
    expect(result, ThemesState.dark);
  });
}
