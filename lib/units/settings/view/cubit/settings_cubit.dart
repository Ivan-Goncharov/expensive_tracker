import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/helpers/set_app_locale.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/domain/settings_repository.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_state.dart';
import 'package:flutter/foundation.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repo;
  SettingsCubit(this._repo) : super(SettingsStateLoading());

  InterfaceLanguage? _language;
  InterfaceLanguage get language => _language ?? InterfaceLanguage.system;

  void init() {
    try {
      _language = _repo.getCurrentInterfaceLanguage();
      emit(SettingsStateSucceful(_language ?? InterfaceLanguage.system));
    } catch (er, st) {
      debugPrint('$er \n $st');
      emit(SettingsStateError());
    }
  }

  Future<void> changeLanguage(InterfaceLanguage newValue) async {
    if (newValue != _language) {
      _language = newValue;
      setAppLocale(language: _language);
      emit(SettingsStateSucceful(_language ?? InterfaceLanguage.system));
      await _repo.saveInterfaceLanguage(newValue);
    }
  }
}
