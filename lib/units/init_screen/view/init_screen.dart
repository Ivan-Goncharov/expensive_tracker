import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/init_screen/cubit/init_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class InitScreenWidget extends StatelessWidget {
//   const InitScreenWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<InitAppCubit>().initial(),
//       child: _InitScreenBody(),
//     );
//   }
// }

// class _InitScreenBody extends StatelessWidget {
//   const _InitScreenBody();

//   @override
//   Widget build(BuildContext context) {
//     // TODO:  В будущем реализовать этот экран с иконкой
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: BlocBuilder<InitAppCubit, InitAppState>(builder: (context, state) {
//         if(state is ) {
//            return const Center(child: Text('InitApp'));
//         } else {
//           return const SizedBox();
//         }
//       }, ),
//     );
//   }
// }
