import 'dart:math' as math;

import 'package:expensive_tracker_app/units/create_expense/data/model/item_operation_model.dart';
import 'package:flutter/material.dart';

/// Подсчет процента от элемента
int calculatePrecent(double overallCount,double currentValue) {
  // final currentValue = values
  //     .map((e) => e.amount)
  //     .toList()
  //     .reduce((value, element) => value + element);

  return ((currentValue * 100) / overallCount).round();
}

/// Генерация цвета для диаграммы
Color generateByIdColor(int id) {
  return Color(((math.Random(id.hashCode).nextDouble()) * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
