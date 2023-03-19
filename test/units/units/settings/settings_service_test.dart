import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/data/services/settings_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();

  test('Get system language', () {
    final result = getIt<SettingsService>().getCurrentInterfaceLanguage();
    expect(result, InterfaceLanguage.system);
  });

  test('Save russian language and get', () async {
    final service = getIt<SettingsService>();
    await service.saveInterfaceLanguage(InterfaceLanguage.russian);
    final result = service.getCurrentInterfaceLanguage();
    expect(result, InterfaceLanguage.russian);
  });
}
