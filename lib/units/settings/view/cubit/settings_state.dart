import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';

abstract class SettingsState extends Equatable {}

class SettingsStateLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsStateSucceful extends SettingsState {
  final InterfaceLanguage language;
  SettingsStateSucceful(this.language);

  @override
  List<Object?> get props => [language];
}

class SettingsStateError extends SettingsState {
  @override
  List<Object?> get props => [2];
}
