import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/create_card_name_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextFieldCard extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldCard(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
      style: NeumorphicStyle(
        depth: NeumorphicTheme.embossDepth(context),
        color: Theme.of(context).colorScheme.background,
        boxShape: const NeumorphicBoxShape.stadium(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextField(
          controller: controller,
          autofocus: true,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          decoration: const InputDecoration.collapsed(hintText: 'Input name'),
          onEditingComplete: context.read<CreateCardNameCubit>().saveInput,
        ),
      ),
    );
  }
}
