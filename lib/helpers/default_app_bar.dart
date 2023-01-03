import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  const DefaultAppBar(
      {super.key, this.height = kToolbarHeight, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colors.background,
      title: Text(title),
      titleTextStyle: TextStyle(
        color: colors.onBackground,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      elevation: 0,
      // leadingWidth: ,
      leading: IconButton(
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: colors.tertiary,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
