import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Подсчет процента от элемента
int calculatePrecent(double overallCount, double currentValue) {
  return ((currentValue * 100) / overallCount).round();
}

/// Генерация цвета для диаграммы
Color generateByIdColor(int id) {
  return Color(((math.Random(id.hashCode).nextDouble()) * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
