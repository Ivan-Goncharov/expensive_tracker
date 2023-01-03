import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/helpers/container_neomorphic_emboss.dart';
import 'package:flutter/material.dart';

class SearchCurrencyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const SearchCurrencyTextField(this.textEditingController, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerNemorophicEmboss(
      boxShape: null,
      widget: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        decoration:
            const InputDecoration.collapsed(hintText: SResources.searchHint),
      ),
      height: 40,
      width: double.infinity,
    );
  }
}
