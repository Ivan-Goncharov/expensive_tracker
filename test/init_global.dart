import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    show PathProviderPlatform;
import 'package:uuid/uuid.dart';

const rootPath = 'test';

void setupTests() {
  TestWidgetsFlutterBinding.ensureInitialized();
  _initPath();

  setUpAll(() {
    initDb();
    setupGetIt();
  });

  tearDownAll(() async => await deleteBdFromDisk());
}

void _initPath() {
  PathProviderPlatform.instance = MokePathProviderPlatform();
}

class MokePathProviderPlatform extends PathProviderPlatform {
  MokePathProviderPlatform() : _randomDirectory = '$rootPath/${const Uuid().v4()}';

  final String _randomDirectory;

  @override
  Future<String?> getApplicationDocumentsPath() =>
      Future.value('$_randomDirectory/documents');
}
