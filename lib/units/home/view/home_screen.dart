import 'package:expensive_tracker_app/units/navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final navState = BlocProvider.of<NavigatorCubit>(context).state
        as NavigationChangePageState;
    return Scaffold(
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          controller: navState.scrollController,
          itemBuilder: (_, index) => ListTile(
            title: Text('Title $index'),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
