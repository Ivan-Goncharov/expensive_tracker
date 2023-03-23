import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:intl/intl.dart';

abstract class ChangeStatsState extends Equatable {}

class ChangeStatsLoading extends ChangeStatsState {
  @override
  List<Object?> get props => [1];
}

class ChangeStatsError extends ChangeStatsState {
  @override
  List<Object?> get props => [2];
}

class ChangeStatsLoaded extends ChangeStatsState {
  final StatsDateType dateType;
  final Map<int, List<ItemOperationModel>> operationes;
  final int summOfElement;

  ChangeStatsLoaded(
    this.dateType,
    this.operationes,
    this.summOfElement,
  );
  
  @override
  List<Object?> get props => [dateType, operationes];
}

enum StatsDateType {
  today,
  yesterDay,
  thisWeek,
  month,
  year,
  allTime;

  String toLocale() {
    switch (this) {
      case StatsDateType.today:
        return t.strings.today;
      case StatsDateType.yesterDay:
        return t.strings.yesterday;

      case StatsDateType.thisWeek:
        return t.strings.thisWeek;

      case StatsDateType.month:
        return t.strings.month;

      case StatsDateType.year:
        return t.strings.year;

      case StatsDateType.allTime:
        return t.strings.allTime;
    }
  }
}
