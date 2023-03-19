import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';

abstract class SettingsService {
  InterfaceLanguage getCurrentInterfaceLanguage();

  Future<void> saveInterfaceLanguage(InterfaceLanguage language);
}

class SettingsServiceImpl implements SettingsService {
  final StorageProvider _storage;

  SettingsServiceImpl(this._storage);

  @override
  InterfaceLanguage getCurrentInterfaceLanguage() {
    final data = _storage.prefs.get(PrefKeys.appLanguage) as String?;
    if (data != null) {
      return InterfaceLanguage.values.byName(data);
    } else {
      return InterfaceLanguage.system;
    }
  }

  @override
  Future<void> saveInterfaceLanguage(InterfaceLanguage language) =>
      _storage.prefs.put(PrefKeys.appLanguage, language.name);
}
