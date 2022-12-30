import 'package:expensive_tracker_app/constants/routes.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/start_screen/view/cubit/start_screen_cubit.dart';
import 'package:expensive_tracker_app/units/start_screen/view/cubit/start_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StartScreenCubit>()..startApp(),
      child: const _StartScreenBody(),
    );
  }
}

class _StartScreenBody extends StatelessWidget {
  const _StartScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartScreenCubit, StartScreenState>(
       
      listener: (context, state) {
        if (state is StartScreenLoadedState) {
          print('DEBUG state $state');
          Navigator.of(context).pushReplacementNamed(navScreenRoute);
        }
      },
      // TODO: реализовать начальный экран.
      child: const Scaffold(
        body: Center(child: Icon(IconDataSolid(0xe2eb))),
      ),
    );
  }
}
