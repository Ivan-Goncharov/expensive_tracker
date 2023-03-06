import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_bloc.dart';
import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';
import 'package:expensive_tracker_app/units/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:expensive_tracker_app/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageProvider.initHiveBoxes();
  setupGetIt();
  runApp(
    BlocProvider(
      create: (_) => getIt<ThemesBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) { 
        return MaterialApp(
          themeMode: state.getThemeMode(),
          darkTheme: MyThemeApp.darkTheme,
          theme: MyThemeApp.lightTheme,
          initialRoute: '/',
          onGenerateRoute: getRoutes,
        );
      },
    );
  }
}
