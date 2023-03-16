import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

Future<void> changeLanguageDialogShow(BuildContext context) async {
  final items = [t.strings.russian, t.strings.english];
  await SmartDialog.show(
      // targetContext: context,
      builder: (_) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          return Material(
            // color: Colors.black,
            child: InkWell(
              onTap: () => SmartDialog.dismiss(),
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text('${items[index]}'),
              ),
            ),
          );
        }),
      ),
    );
  });
}
