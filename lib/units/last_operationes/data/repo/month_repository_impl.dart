import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';
import 'package:expensive_tracker_app/units/start_screen/data/services/start_screen_service.dart';
import 'package:rxdart/subjects.dart';

class MothRepositoryImpl implements MonthRepositoty {
  final StartScreenService _service;
  MothRepositoryImpl(this._service);

  List<DateTime> _listOfMonth = [];

  final _monthStreamController = BehaviorSubject<int>();

  late DateTime _currentDate;

  @override
  List<DateTime> get listOfMonth => _listOfMonth;

  @override
  DateTime get currentDate => _currentDate;

  @override
  Future<void> getListOfMonth() async {
    _listOfMonth = (await _service.getMonthList()).reversed.toList();
    _currentDate = _listOfMonth.first;
  }

  @override
  Stream<int> getMonth() => _monthStreamController.asBroadcastStream();

  @override
  void addMonthInStream(int index) {
    _monthStreamController.add(index);
    _currentDate = _listOfMonth[index];
  }
}
