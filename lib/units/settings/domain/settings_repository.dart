import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';

abstract class SettingsRepository {
  InterfaceLanguage getCurrentInterfaceLanguage();

  Future<void> saveInterfaceLanguage(InterfaceLanguage language);
}
