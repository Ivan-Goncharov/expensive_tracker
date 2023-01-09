import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/helpers/default_app_bar.dart';
import 'package:expensive_tracker_app/units/add_balance_card/view/components/text_field_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddBalanceCardView extends StatelessWidget {
  const AddBalanceCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: SResources.addNewCardBarTitle),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const _FieldTitle(SResources.nameOfCardTitle),
              const SizedBox(height: 8),
              AddCardNameText(
                  textController: TextEditingController(),
                  hintTitle: SResources.addCardNameHint),
              const SizedBox(height: 16),
              const _FieldTitle(SResources.balance),
              const SizedBox(height: 8),
              AddCardNameText(
                textController: TextEditingController(),
                hintTitle: SResources.addCardCurrencyHint,
                textInputTupe:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'(^\d*\.?\d*)'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const _FieldTitle(SResources.currency),
              // const SelectCurrencyButton(getI)
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldTitle extends StatelessWidget {
  final String title;
  const _FieldTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
