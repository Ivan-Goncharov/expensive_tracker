import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/components/error_or_loading.dart';
import 'package:expensive_tracker_app/units/settings/components/change_language.dart';
import 'package:expensive_tracker_app/units/settings/components/change_theme.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_cubit.dart';
import 'package:expensive_tracker_app/units/settings/view/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (_) => getIt<SettingsCubit>()..init(),
      child: const _SettingsScreenBody(),
    );
  }
}

class _SettingsScreenBody extends StatelessWidget {
  const _SettingsScreenBody();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.strings.settings),
        ),
        backgroundColor: colors.background,
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state is SettingsStateLoading) {
              /// Состояние загрузки
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SettingsStateError) {
              /// Состояние ошибки
              return ErrorIconWithDescription(
                title: t.strings.error,
                iconData: FontAwesomeIcons.triangleExclamation,
              );
            } else {
              /// Успешное состояние
              return ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  /// Смена темы
                  ChangeThemeView(),

                  /// Смена языка
                  ChangeLanguageSettings(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
