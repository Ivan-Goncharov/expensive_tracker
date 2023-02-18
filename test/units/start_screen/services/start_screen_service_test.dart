import 'package:expensive_tracker_app/constants/shared_pref_constants.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../init_global.dart';

void main() async {
  setupTests(); 
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();  

  tearDownAll(() async {
    await prefs.clear();
  });

  test('Is first start test', () async {
    final result = await getIt<StartScreenService>().isNotFirstStart();
    expect(false, result);
  });

  test('Is not first start test', () async {
    await prefs.setBool(isFirstStartConst, true);
    final result = await getIt<StartScreenService>().isNotFirstStart();
    expect(true, result);
  });
}
