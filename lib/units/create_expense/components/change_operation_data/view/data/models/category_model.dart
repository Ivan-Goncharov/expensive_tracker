import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryOperationModel extends Equatable {
  final String title;
  final IconData icon;

  const CategoryOperationModel({
    required this.title,
    required this.icon,
  });

  @override
  List<Object?> get props => [title, icon];

  @override
  bool? get stringify => true;
}
