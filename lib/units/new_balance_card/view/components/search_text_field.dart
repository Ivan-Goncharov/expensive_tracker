import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/add_balance_card/view/components/input_container_material.dart';
import 'package:flutter/material.dart';

class SearchCurrencyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const SearchCurrencyTextField(this.textEditingController, {super.key});

  @override
  Widget build(BuildContext context) {
    return InputContainerMaterial(
      elevation: 6,
      child: TextField(
        controller: textEditingController,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        decoration:
            const InputDecoration.collapsed(hintText: SResources.searchHint),
      ),
    );
  }
}
