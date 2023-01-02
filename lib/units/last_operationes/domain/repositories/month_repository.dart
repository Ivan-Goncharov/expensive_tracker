abstract class MonthRepositoty {
  Stream<int> getMonth();

  List<DateTime> get listOfMonth;

  Future<void> getListOfMonth();

  void addMonthInStream(int index);

  DateTime get currentDate;
}
