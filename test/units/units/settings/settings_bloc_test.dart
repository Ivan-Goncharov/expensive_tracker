import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/settings/data/entity/settings_dropdown_model.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_cubit.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();

  setUp(() => EquatableConfig.stringify = true);

  blocTest<SettingsCubit, SettingsState>(
      'Get system language SettingsCubit test',
      build: () => getIt<SettingsCubit>(),
      act: (cubit) => cubit.init(),
      expect: () => [
            SettingsStateSucceful(InterfaceLanguage.system),
          ]);

  blocTest<SettingsCubit, SettingsState>(
      'Save english language SettingsCubit test',
      build: () => getIt<SettingsCubit>(),
      act: (cubit) => cubit.changeLanguage(InterfaceLanguage.english),
      expect: () => [
            SettingsStateSucceful(InterfaceLanguage.english),
          ]);
}
