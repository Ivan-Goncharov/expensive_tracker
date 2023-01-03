//класс для кастомной анимации перехода на экран
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SlideTransitionPageRoute extends PageRouteBuilder {
  final Widget child;

  SlideTransitionPageRoute({required this.child, RouteSettings? settings})
      : super(
          pageBuilder: (contex, animation, secondaryAnimation) => child,
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          settings: settings,
        );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
