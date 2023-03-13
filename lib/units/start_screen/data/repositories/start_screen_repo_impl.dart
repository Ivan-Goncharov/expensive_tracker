import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/last_operationes_repo.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:expensive_tracker_app/units/start_screen/domain/repositories/start_screen_repo.dart';

class StartScreenRepoImpl implements StartScreenRepo {
  final StartScreenService _service;

  const StartScreenRepoImpl(this._service);

  @override
  bool isFirstStart() => _service.isNotFirstStart();

  @override
  Future<void> saveStartInfo() => _service.saveFirstStart();

  @override
  Future<void> getAllCategories() async {
    getIt<LastOperationesRepo>().categories = await _service.getCategories();
  }
}
