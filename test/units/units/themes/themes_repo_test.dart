import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/theme/domain/themes_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();

  test('Get default theme from repo test', () {
    final result = getIt<ThemesRepository>().getAppTheme();
    expect(result, ThemesState.system);
  });

  test('Save light theme in ThemesRepository test', () async {
    final repo = getIt<ThemesRepository>();
    await repo.saveAppTheme(ThemesState.light);
    final result = repo.getAppTheme();
    expect(result, ThemesState.light);
  });
}
