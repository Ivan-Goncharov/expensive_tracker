import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NextButtonView extends StatelessWidget {
  final void Function() nextFunction;
  final bool isShowButton;
  const NextButtonView(this.nextFunction, this.isShowButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isShowButton ? 40 : 0,
      duration: const Duration(milliseconds: 200),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 6,
          color: Theme.of(context).colorScheme.background,
          boxShape: const NeumorphicBoxShape.stadium(),
          shape: NeumorphicShape.flat,
        ),
        child: InkWell(
          onTap: () => nextFunction(),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40,
            child: Text(
              t.strings.nextButtonCreate,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
