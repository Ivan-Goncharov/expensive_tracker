import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/domain/settings_repository.dart';

void setAppLocale({InterfaceLanguage? language}) {
  final locale =
      language ?? getIt<SettingsRepository>().getCurrentInterfaceLanguage();
  if (locale == InterfaceLanguage.system) {
    LocaleSettings.useDeviceLocale();
  } else {
    LocaleSettings.setLocale(locale.toAppLocale());
  }
}
