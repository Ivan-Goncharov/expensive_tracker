import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/domain/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();

  test('Get system language from ThemesRepository test', () {
    final result = getIt<SettingsRepository>().getCurrentInterfaceLanguage();
    expect(result, InterfaceLanguage.system);
  });

  test('Save english language in ThemesRepository test', () async {
    final repo = getIt<SettingsRepository>();
    await repo.saveInterfaceLanguage(InterfaceLanguage.english);
    final result = repo.getCurrentInterfaceLanguage();
    expect(result, InterfaceLanguage.english);
  });
}
