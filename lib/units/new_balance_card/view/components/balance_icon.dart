import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BalanceIcon extends StatelessWidget {
  final IconData iconData;
  const BalanceIcon(this.iconData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.circle(),
          color: Theme.of(context).colorScheme.background),
      child: Container(
        // decoration: BoxDecoration(shape: BoxShape.circle),
        width: 130,
        height: 130,
        alignment: Alignment.center,
        child: Icon(
          iconData,
          size: 40,
        ),
      ),
    );
  }
}
