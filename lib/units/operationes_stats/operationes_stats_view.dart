import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';

class OperationesStatsView extends StatelessWidget {
  const OperationesStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            children: [
              TextButton(
                child: const Text(
                  'Create new card',
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, addNewBalanceCardRoute),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
