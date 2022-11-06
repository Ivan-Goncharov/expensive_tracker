import 'package:expensive_tracker_app/constants/routes.dart';
import 'package:expensive_tracker_app/units/create_expense/view/create_expense_screen.dart';
import 'package:expensive_tracker_app/units/navigation/nav_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const NavScreen(),
        settings: settings,
      );
    case createExpenseRoute:
      return MaterialPageRoute(
        builder: (_) => const CreateExpenseScreen(),
        settings: settings,
      );
  }
  return null;
}
