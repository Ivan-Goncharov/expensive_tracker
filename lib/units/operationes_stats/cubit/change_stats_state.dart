import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/operationes_stats/data/entity/stats_model_cubit.dart';

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
  final StatsModel statsModel;
  final Map<StatsDateType, List<DateTime>> mapOfDateType;

  /// Текущий выбранный месяц
  final DateTime currentStatsMonth;

  /// Текущий выбранный год
  final DateTime currentStatsYear;

  /// Cписок месяцев, которые есть в статистике
  List<DateTime> get listOfMonthStats =>
      mapOfDateType[StatsDateType.month] ?? [];

  /// Cписок годов, которые есть в статистике
  List<DateTime> get listOfYearStats => mapOfDateType[StatsDateType.year] ?? [];

  ChangeStatsLoaded({
    required this.dateType,
    required this.statsModel,
    required this.mapOfDateType,
    required this.currentStatsMonth,
    required this.currentStatsYear,
  });

  @override
  List<Object?> get props => [dateType, statsModel];
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
