import 'package:expensive_tracker_app/units/balance_cards/view/balance_card_view.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/balance_cards_carousel.dart';
import 'package:expensive_tracker_app/units/home/view/components/month_view.dart';
import 'package:expensive_tracker_app/units/last_operationes/view/last_operationes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            BalanceCardsCarousel(),
            SizedBox(height: 10),
            MonthView(),
            SizedBox(height: 10),
            Expanded(child: LastOperationesView()),
          ],
        ),
      ),
    );
  }
}
