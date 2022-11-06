import 'package:expensive_tracker_app/units/home/view/components/balance_card.dart';
import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navState = BlocProvider.of<NavigatorCubit>(context).state as NavigationChangePageState;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BalanceCard(),
            Expanded(
              child: ListView.builder(
                controller: navState.scrollController,
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
