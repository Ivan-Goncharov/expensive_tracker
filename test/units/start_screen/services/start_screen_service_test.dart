import 'package:drift/native.dart';
import 'package:expensive_tracker_app/constants/shared_pref_constants.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final startScreenService = getIt<StartScreenService>();
  setUpAll(() {
    initDb(NativeDatabase.memory());
  });

  tearDownAll(() async {
    await prefs.clear();
    await database.close();
  });

  test('Is first start test', () async {
    final result = await startScreenService.isNotFirstStart();
    expect(false, result);
  });

  test('Is not first start test', () async {
    await prefs.setBool(isFirstStartConst, true);
    final result = await startScreenService.isNotFirstStart();
    expect(true, result);
  });
}
