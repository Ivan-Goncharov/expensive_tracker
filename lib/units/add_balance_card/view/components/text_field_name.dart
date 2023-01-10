import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddCardNameText extends StatelessWidget {
  final String hintTitle;
  final TextInputType? textInputTupe;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) function;
  const AddCardNameText({
    required this.hintTitle,
    this.textInputTupe,
    this.inputFormatters,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerNemorophicEmboss(
      boxShape: null,
      widget: TextFormField(
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
        onChanged: function,
      ),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
