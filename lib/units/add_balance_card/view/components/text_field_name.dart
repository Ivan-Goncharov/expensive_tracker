import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddCardNameText extends StatelessWidget {
  final TextEditingController textController;
  final String hintTitle;
  final TextInputType? textInputTupe;
  final List<TextInputFormatter>? inputFormatters;
  const AddCardNameText({
    required this.textController,
    required this.hintTitle,
    this.textInputTupe,
    this.inputFormatters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerNemorophicEmboss(
      boxShape: null,
      widget: TextFormField(
        controller: textController,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        decoration: InputDecoration.collapsed(
          hintText: hintTitle,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        keyboardType: textInputTupe,
        inputFormatters: inputFormatters,
      ),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
