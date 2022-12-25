import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';

class StartScreenRepoImpl implements StartScreenRepo {
  final StartScreenService _service;

  const StartScreenRepoImpl(this._service);

  @override
  Future<bool> isFirstStart() {
    return _service.isFirstStart();
  }

  @override
  Future<void> saveStartInfo() {
    return _service.saveFirstStart();
  }
}
