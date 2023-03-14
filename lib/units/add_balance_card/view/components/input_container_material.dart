import 'package:flutter/material.dart';

class InputContainerMaterial extends StatelessWidget {
  final Widget child;
  final double elevation;
  const InputContainerMaterial({
    super.key,
    required this.child,
    this.elevation = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          height: 50,
          child: child),
    );
  }
}
