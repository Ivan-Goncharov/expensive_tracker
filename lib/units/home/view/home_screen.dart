import 'package:expensive_tracker_app/units/home/view/components/balance_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BalanceCard(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text('Title $index'),
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
