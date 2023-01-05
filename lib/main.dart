import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/routes/router.dart';
import 'package:expensive_tracker_app/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  setupGetIt();
  initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeApp.lightColorScheme,
      initialRoute: '/',
      onGenerateRoute: getRoutes,
    );
  }
}
