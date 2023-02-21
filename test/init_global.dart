import 'dart:io';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    show PathProviderPlatform;
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

const rootPath = 'test';

void setupTests() {
  TestWidgetsFlutterBinding.ensureInitialized();
  _initPath();

  setUpAll(() {
    initDb();
    setupGetIt();
  });

  tearDownAll(() async {
    await deleteBdFromDisk();
    final aplicationPath = await getApplicationDocumentsDirectory();
    // final dir = Directory(aplicationPath.path);
    final dir = Directory(aplicationPath.path.replaceAll('/documents', ''));
    print(dir);
    if (dir.existsSync()) {
      print('DEBUG exist');
      await dir.delete(recursive: false);

      print('DEBUG after exist ${dir.existsSync()}');
 
    }
  });
}

void _initPath() {
  PathProviderPlatform.instance = MokePathProviderPlatform();
}

class MokePathProviderPlatform extends PathProviderPlatform {
  MokePathProviderPlatform()
      : _randomDirectory = '$rootPath/${const Uuid().v4()}';

  final String _randomDirectory;

  @override
  Future<String?> getApplicationDocumentsPath() =>
      Future.value('$_randomDirectory/documents');
}
