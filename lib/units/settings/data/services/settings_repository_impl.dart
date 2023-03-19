import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/data/services/settings_service.dart';
import 'package:expensive_tracker_app/units/settings/domain/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsService _service;
  SettingsRepositoryImpl(this._service);

  @override
  InterfaceLanguage getCurrentInterfaceLanguage() =>
      _service.getCurrentInterfaceLanguage();

  @override
  Future<void> saveInterfaceLanguage(InterfaceLanguage language) =>
      _service.saveInterfaceLanguage(language);
}
