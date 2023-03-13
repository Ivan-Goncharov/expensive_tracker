import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/storage_provider.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../init_global.dart';

void main() async {
  setupTests();

  test('Is first start test', () {
    final result = getIt<StartScreenService>().isNotFirstStart();
    expect(false, result);
  });

  test('Is not first start test', () async {
    await getIt<StorageProvider>().prefs.put(PrefKeys.isFirstStartConst, true);
    final result = getIt<StartScreenService>().isNotFirstStart();
    expect(true, result);
  });
}
