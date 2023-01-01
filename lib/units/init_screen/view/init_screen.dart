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
