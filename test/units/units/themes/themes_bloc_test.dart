import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_bloc.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();
  setUp(() => EquatableConfig.stringify = true);

  // blocTest(
  //   'Themes bloc - get default themes',
  //   build: () => getIt<ThemesBloc>(),
  //   expect: () => ThemesState.system,
  // );

  blocTest(
    'Themes bloc - save dark themes',
    build: () => getIt<ThemesBloc>(),
    act: (bloc) => bloc.add(ThemesState.dark),
    expect: () => [ThemesState.dark],
  );
}
