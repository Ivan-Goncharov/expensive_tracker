import 'package:expensive_tracker_app/constants/prefs_constant.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageProvider {
  /// База данных.
  final database = AppDb();

  /// Prefs storage.
  final prefs = Hive.box(HiveBoxes.prefs);

  /// Инициализация Hive
  static Future<void> initHiveBoxes() async {
    await Hive.initFlutter();
    print('DEBUG OPEN BOX');
    await Hive.openBox(HiveBoxes.prefs);
  }

  // Удаление базы данных
  Future<void> deleteStorage() async {
    await prefs.deleteFromDisk();
    await database.deleteBdFromDisk();
  }
}
