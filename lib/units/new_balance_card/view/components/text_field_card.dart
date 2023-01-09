import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';

import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/cubit/create_card_name_cubit%20copy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextFieldCard extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldCard(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerNemorophicEmboss(
      widget: TextField(
        controller: controller,
        autofocus: true,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        decoration: const InputDecoration.collapsed(hintText: 'Input name'),
        onEditingComplete: context.read<CreateCardNameCubit>().saveInput,
      ),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}
