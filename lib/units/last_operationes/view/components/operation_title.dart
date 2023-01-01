import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationTitle extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  const OperationTitle(this.dateTime, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(DateFormat('h:mm a d MMM, yyyy').format(dateTime)),
      ],
    );
  }
}
