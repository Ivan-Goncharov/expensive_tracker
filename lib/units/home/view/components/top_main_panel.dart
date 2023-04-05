import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        _ItemElement(
          iconData: FontAwesomeIcons.chartSimple,
          route: chartStatsRoute,
        ),
        _ItemElement(
          iconData: FontAwesomeIcons.gear,
          route: settingsAppRoute,
        ),
      ],
    );
  }
}

class _ItemElement extends StatelessWidget {
  final String route;
  final IconData iconData;
  const _ItemElement({required this.route, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      icon: FaIcon(iconData),
    );
  }
}
