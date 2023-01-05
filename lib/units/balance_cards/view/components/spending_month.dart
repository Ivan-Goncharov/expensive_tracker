import 'package:expensive_tracker_app/constants/string_constants.dart';
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
              title: SResources.income,
              quantity: monthAmountModel.income,
              icon: FontAwesomeIcons.arrowUp),
          _SpendingWidget(
              color: Colors.red,
              title: SResources.expense,
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
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 16,
            color: color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              quantity.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
