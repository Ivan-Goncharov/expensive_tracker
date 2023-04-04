import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';

/// Модель для работы со списками операций на экране обзора статистики.
class StatsModel extends Equatable {
  // Мапа с id категории и списком операций по ней
  final Map<int, List<ItemOperationModel>> mapOfOperationes;
  // Мапа c id категории и суммой трат по данной категории
  final Map<int, double> categorySpendMap;
  // Суммая общих трат в мапе
  final double totalSpend;

  const StatsModel(
    this.mapOfOperationes,
    this.categorySpendMap,
    this.totalSpend,
  );

  factory StatsModel.create(
      {required Map<int, List<ItemOperationModel>> mapOfOperationes,
      required Map<int, double> categorySpendMap}) {
    return StatsModel(
      mapOfOperationes,
      categorySpendMap,
      _getSummElements(mapOfOperationes),
    );
  }

  @override
  List<Object?> get props => [mapOfOperationes, categorySpendMap, totalSpend];

  @override
  bool? get stringify => true;
}

/// Получение общей суммы элементов в списках
double _getSummElements(Map<int, List<ItemOperationModel>> map) {
  var summ = 0.0;
  map.forEach((key, value) {
    summ += value
        .map((e) => e.amount)
        .toList()
        .reduce((value, element) => value + element);
  });
  return summ;
}
