import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ContainerNemorophicEmboss extends StatelessWidget {
  final Widget widget;
  final double height;
  final double width;
  final NeumorphicBoxShape? boxShape;
  const ContainerNemorophicEmboss({
    super.key,
    required this.widget,
    required this.height,
    required this.width,
    this.boxShape = const NeumorphicBoxShape.stadium(),
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      style: NeumorphicStyle(
        depth: NeumorphicTheme.embossDepth(context),
        color: Theme.of(context).colorScheme.background,
        boxShape: boxShape,
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        child: widget,
      ),
    );
  }
}
