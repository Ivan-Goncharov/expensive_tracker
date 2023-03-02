import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/routes/router.dart'; 
import 'package:flutter/material.dart';
import 'package:expensive_tracker_app/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageProvider.initHiveBoxes();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeApp.lightTheme,
      initialRoute: '/',
      onGenerateRoute: getRoutes,
    );
  }
}
