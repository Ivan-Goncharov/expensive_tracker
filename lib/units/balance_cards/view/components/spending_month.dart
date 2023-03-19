import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';

import 'package:expensive_tracker_app/units/balance_cards/data/models/month_operation_amount_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpendingMonth extends StatelessWidget {
  final MonthOperationAmountModel monthAmountModel;
  const SpendingMonth(this.monthAmountModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SpendingWidget(
              color: Colors.green,
              title: t.strings.income,
              quantity: monthAmountModel.income,
              icon: FontAwesomeIcons.arrowUp),
          _SpendingWidget(
              color: Colors.red,
              title: t.strings.expense,
              quantity: monthAmountModel.expense,
              icon: FontAwesomeIcons.arrowDown),
        ],
      ),
    );
  }
}

class _SpendingWidget extends StatelessWidget {
  final Color color;
  final String title;
  final double quantity;
  final IconData icon;
  const _SpendingWidget({
    required this.color,
    required this.title,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: colors.background,
              shape: BoxShape.circle,
              border: Border.all(color: colors.primary)),
          child: Icon(
            icon,
            size: 16,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: colors.outline),
            ),
            AnimatedFlipCounter(
              value: quantity,
              duration: const Duration(milliseconds: 500),
              textStyle: TextStyle(color: colors.onSurfaceVariant),
            )
          ],
        )
      ],
    );
  }
}
