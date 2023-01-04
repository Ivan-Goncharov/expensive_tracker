import 'package:expensive_tracker_app/units/new_balance_card/view/create_balance_amount_view.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/search_currencies_view.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:expensive_tracker_app/units/create_expense/view/create_expense_screen.dart';
import 'package:expensive_tracker_app/units/navigation/nav_screen.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/create_balance_currency_view.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/create_balance_name_view.dart';
import 'package:expensive_tracker_app/units/routes/slide_transition.dart';
import 'package:expensive_tracker_app/units/start_screen/view/start_screen_view.dart';
import 'package:flutter/material.dart';

Route<dynamic>? getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const StartScreenView(),
        settings: settings,
      );
    case navScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const NavScreen(),
        settings: settings,
      );
    case createExpenseRoute:
      return MaterialPageRoute(
        builder: (_) => const CreateExpenseScreen(),
        settings: settings,
      );
    case createBalanceCardName:
      return MaterialPageRoute(
        builder: (_) => const CreateBalanceNameView(),
        settings: settings,
      );
    case selectCurrencyRoute:
      return MaterialPageRoute(
        builder: (_) => const SelectBalanceCardView(),
        settings: settings,
      );
    case createBalanceAmountRoute:
      return MaterialPageRoute(
        builder: (_) => const CreateBalanceAmount(),
        settings: settings,
      );

    case searchCurrensiesRoute:
      return SlideTransitionPageRoute(
        child: const SearchCurrensiesView(),
        settings: settings,
      );
  }
  return null;
}
